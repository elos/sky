library angular2.src.core.compiler.template_compiler;

import "package:angular2/src/core/facade/lang.dart"
    show Type, Json, isBlank, stringify;
import "package:angular2/src/core/facade/exceptions.dart" show BaseException;
import "package:angular2/src/core/facade/collection.dart"
    show ListWrapper, SetWrapper;
import "package:angular2/src/core/facade/async.dart"
    show PromiseWrapper, Future;
import "package:angular2/src/core/linker/template_commands.dart"
    show CompiledTemplate, TemplateCmd, nextTemplateId, CompiledHostTemplate;
import "directive_metadata.dart"
    show
        createHostComponentMeta,
        CompileDirectiveMetadata,
        CompileTypeMetadata,
        CompileTemplateMetadata;
import "template_ast.dart" show TemplateAst;
import "package:angular2/src/core/di.dart" show Injectable;
import "source_module.dart" show SourceModule, moduleRef;
import "change_detector_compiler.dart" show ChangeDetectionCompiler;
import "style_compiler.dart" show StyleCompiler;
import "command_compiler.dart" show CommandCompiler;
import "template_parser.dart" show TemplateParser;
import "template_normalizer.dart" show TemplateNormalizer;
import "runtime_metadata.dart" show RuntimeMetadataResolver;
import "package:angular2/src/core/application_tokens.dart" show APP_ID;
import "command_compiler.dart" show TEMPLATE_COMMANDS_MODULE_REF;
import "util.dart"
    show
        IS_DART,
        codeGenExportVariable,
        escapeSingleQuoteString,
        codeGenValueFn,
        MODULE_SUFFIX;
import "package:angular2/src/core/di.dart" show Inject;

@Injectable()
class TemplateCompiler {
  RuntimeMetadataResolver _runtimeMetadataResolver;
  TemplateNormalizer _templateNormalizer;
  TemplateParser _templateParser;
  StyleCompiler _styleCompiler;
  CommandCompiler _commandCompiler;
  ChangeDetectionCompiler _cdCompiler;
  var _hostCacheKeys = new Map<Type, dynamic>();
  var _compiledTemplateCache = new Map<dynamic, CompiledTemplate>();
  var _compiledTemplateDone = new Map<dynamic, Future<CompiledTemplate>>();
  String _appId;
  TemplateCompiler(
      this._runtimeMetadataResolver,
      this._templateNormalizer,
      this._templateParser,
      this._styleCompiler,
      this._commandCompiler,
      this._cdCompiler,
      @Inject(APP_ID) String appId) {
    this._appId = appId;
  }
  Future<CompileDirectiveMetadata> normalizeDirectiveMetadata(
      CompileDirectiveMetadata directive) {
    if (!directive.isComponent) {
      // For non components there is nothing to be normalized yet.
      return PromiseWrapper.resolve(directive);
    }
    return this
        ._templateNormalizer
        .normalizeTemplate(directive.type, directive.template)
        .then((CompileTemplateMetadata normalizedTemplate) =>
            new CompileDirectiveMetadata(
                type: directive.type,
                isComponent: directive.isComponent,
                dynamicLoadable: directive.dynamicLoadable,
                selector: directive.selector,
                exportAs: directive.exportAs,
                changeDetection: directive.changeDetection,
                inputs: directive.inputs,
                outputs: directive.outputs,
                hostListeners: directive.hostListeners,
                hostProperties: directive.hostProperties,
                hostAttributes: directive.hostAttributes,
                lifecycleHooks: directive.lifecycleHooks,
                template: normalizedTemplate));
  }

  Future<CompiledHostTemplate> compileHostComponentRuntime(Type type) {
    var hostCacheKey = this._hostCacheKeys[type];
    if (isBlank(hostCacheKey)) {
      hostCacheKey = new Object();
      this._hostCacheKeys[type] = hostCacheKey;
      CompileDirectiveMetadata compMeta =
          this._runtimeMetadataResolver.getMetadata(type);
      assertComponent(compMeta);
      CompileDirectiveMetadata hostMeta =
          createHostComponentMeta(compMeta.type, compMeta.selector);
      this._compileComponentRuntime(
          hostCacheKey, hostMeta, [compMeta], new Set());
    }
    return this._compiledTemplateDone[hostCacheKey].then(
        (compiledTemplate) => new CompiledHostTemplate(() => compiledTemplate));
  }

  clearCache() {
    this._hostCacheKeys.clear();
    this._styleCompiler.clearCache();
    this._compiledTemplateCache.clear();
    this._compiledTemplateDone.clear();
  }

  CompiledTemplate _compileComponentRuntime(
      dynamic cacheKey,
      CompileDirectiveMetadata compMeta,
      List<CompileDirectiveMetadata> viewDirectives,
      Set<dynamic> compilingComponentCacheKeys) {
    var compiledTemplate = this._compiledTemplateCache[cacheKey];
    var done = this._compiledTemplateDone[cacheKey];
    if (isBlank(compiledTemplate)) {
      var styles;
      var changeDetectorFactory;
      var commands;
      var templateId = nextTemplateId();
      compiledTemplate = new CompiledTemplate(
          templateId, (_a, _b) => [changeDetectorFactory, commands, styles]);
      this._compiledTemplateCache[cacheKey] = compiledTemplate;
      compilingComponentCacheKeys.add(cacheKey);
      done = PromiseWrapper
          .all((new List.from([
        (this._styleCompiler.compileComponentRuntime(
            this._appId, templateId, compMeta.template) as dynamic)
      ])
            ..addAll(viewDirectives
                .map((dirMeta) => this.normalizeDirectiveMetadata(dirMeta))
                .toList())))
          .then((List<dynamic> stylesAndNormalizedViewDirMetas) {
        var childPromises = [];
        var normalizedViewDirMetas =
            ListWrapper.slice(stylesAndNormalizedViewDirMetas, 1);
        var parsedTemplate = this._templateParser.parse(
            compMeta.template.template,
            normalizedViewDirMetas,
            compMeta.type.name);
        var changeDetectorFactories = this._cdCompiler.compileComponentRuntime(
            compMeta.type, compMeta.changeDetection, parsedTemplate);
        changeDetectorFactory = changeDetectorFactories[0];
        styles = stylesAndNormalizedViewDirMetas[0];
        commands = this._compileCommandsRuntime(
            compMeta,
            templateId,
            parsedTemplate,
            changeDetectorFactories,
            compilingComponentCacheKeys,
            childPromises);
        return PromiseWrapper.all(childPromises);
      }).then((_) {
        SetWrapper.delete(compilingComponentCacheKeys, cacheKey);
        return compiledTemplate;
      });
      this._compiledTemplateDone[cacheKey] = done;
    }
    return compiledTemplate;
  }

  List<TemplateCmd> _compileCommandsRuntime(
      CompileDirectiveMetadata compMeta,
      num templateId,
      List<TemplateAst> parsedTemplate,
      List<Function> changeDetectorFactories,
      Set<Type> compilingComponentCacheKeys,
      List<Future<dynamic>> childPromises) {
    return this._commandCompiler.compileComponentRuntime(
        compMeta,
        this._appId,
        templateId,
        parsedTemplate,
        changeDetectorFactories, (CompileDirectiveMetadata childComponentDir) {
      var childCacheKey = childComponentDir.type.runtime;
      List<CompileDirectiveMetadata> childViewDirectives = this
          ._runtimeMetadataResolver
          .getViewDirectivesMetadata(childComponentDir.type.runtime);
      var childIsRecursive =
          SetWrapper.has(compilingComponentCacheKeys, childCacheKey);
      var childTemplate = this._compileComponentRuntime(childCacheKey,
          childComponentDir, childViewDirectives, compilingComponentCacheKeys);
      if (!childIsRecursive) {
        // Only wait for a child if it is not a cycle
        childPromises.add(this._compiledTemplateDone[childCacheKey]);
      }
      return childTemplate;
    });
  }

  SourceModule compileTemplatesCodeGen(
      List<NormalizedComponentWithViewDirectives> components) {
    if (identical(components.length, 0)) {
      throw new BaseException("No components given");
    }
    var declarations = [];
    var templateArguments = [];
    List<CompileDirectiveMetadata> componentMetas = [];
    var templateIdVariable = "templateId";
    var appIdVariable = "appId";
    components.forEach((componentWithDirs) {
      var compMeta = (componentWithDirs.component as CompileDirectiveMetadata);
      assertComponent(compMeta);
      componentMetas.add(compMeta);
      this._processTemplateCodeGen(
          compMeta,
          appIdVariable,
          templateIdVariable,
          (componentWithDirs.directives as List<CompileDirectiveMetadata>),
          declarations,
          templateArguments);
      if (compMeta.dynamicLoadable) {
        var hostMeta =
            createHostComponentMeta(compMeta.type, compMeta.selector);
        componentMetas.add(hostMeta);
        this._processTemplateCodeGen(hostMeta, appIdVariable,
            templateIdVariable, [compMeta], declarations, templateArguments);
      }
    });
    ListWrapper.forEachWithIndex(componentMetas,
        (CompileDirectiveMetadata compMeta, num index) {
      var templateDataFn = codeGenValueFn([
        appIdVariable,
        templateIdVariable
      ], '''[${ ( ( templateArguments [ index ] as List < dynamic > ) ) . join ( "," )}]''');
      var compiledTemplateExpr =
          '''new ${ TEMPLATE_COMMANDS_MODULE_REF}CompiledTemplate(${ TEMPLATE_COMMANDS_MODULE_REF}nextTemplateId(),${ templateDataFn})''';
      var variableValueExpr;
      if (compMeta.type.isHost) {
        var factoryName = '''_hostTemplateFactory${ index}''';
        declarations.add(
            '''${ codeGenValueFn ( [ ] , compiledTemplateExpr , factoryName )};''');
        var constructionKeyword = IS_DART ? "const" : "new";
        variableValueExpr =
            '''${ constructionKeyword} ${ TEMPLATE_COMMANDS_MODULE_REF}CompiledHostTemplate(${ factoryName})''';
      } else {
        variableValueExpr = compiledTemplateExpr;
      }
      declarations.add(
          '''${ codeGenExportVariable ( templateVariableName ( compMeta . type ) , compMeta . type . isHost )}${ variableValueExpr};''');
    });
    var moduleUrl = components[0].component.type.moduleUrl;
    return new SourceModule(
        '''${ templateModuleUrl ( moduleUrl )}''', declarations.join("\n"));
  }

  List<SourceModule> compileStylesheetCodeGen(
      String stylesheetUrl, String cssText) {
    return this._styleCompiler.compileStylesheetCodeGen(stylesheetUrl, cssText);
  }

  _processTemplateCodeGen(
      CompileDirectiveMetadata compMeta,
      String appIdExpr,
      String templateIdExpr,
      List<CompileDirectiveMetadata> directives,
      List<String> targetDeclarations,
      List<List<dynamic>> targetTemplateArguments) {
    var styleExpr = this
        ._styleCompiler
        .compileComponentCodeGen(appIdExpr, templateIdExpr, compMeta.template);
    var parsedTemplate = this
        ._templateParser
        .parse(compMeta.template.template, directives, compMeta.type.name);
    var changeDetectorsExprs = this._cdCompiler.compileComponentCodeGen(
        compMeta.type, compMeta.changeDetection, parsedTemplate);
    var commandsExpr = this._commandCompiler.compileComponentCodeGen(
        compMeta,
        appIdExpr,
        templateIdExpr,
        parsedTemplate,
        changeDetectorsExprs.expressions,
        codeGenComponentTemplateFactory);
    addAll(styleExpr.declarations, targetDeclarations);
    addAll(changeDetectorsExprs.declarations, targetDeclarations);
    addAll(commandsExpr.declarations, targetDeclarations);
    targetTemplateArguments.add([
      changeDetectorsExprs.expressions[0],
      commandsExpr.expression,
      styleExpr.expression
    ]);
  }
}

class NormalizedComponentWithViewDirectives {
  CompileDirectiveMetadata component;
  List<CompileDirectiveMetadata> directives;
  NormalizedComponentWithViewDirectives(this.component, this.directives) {}
}

assertComponent(CompileDirectiveMetadata meta) {
  if (!meta.isComponent) {
    throw new BaseException(
        '''Could not compile \'${ meta . type . name}\' because it is not a component.''');
  }
}

String templateVariableName(CompileTypeMetadata type) {
  return '''${ type . name}Template''';
}

String templateModuleUrl(String moduleUrl) {
  var urlWithoutSuffix =
      moduleUrl.substring(0, moduleUrl.length - MODULE_SUFFIX.length);
  return '''${ urlWithoutSuffix}.template${ MODULE_SUFFIX}''';
}

addAll(List<dynamic> source, List<dynamic> target) {
  for (var i = 0; i < source.length; i++) {
    target.add(source[i]);
  }
}

String codeGenComponentTemplateFactory(
    CompileDirectiveMetadata nestedCompType) {
  return '''${ moduleRef ( templateModuleUrl ( nestedCompType . type . moduleUrl ) )}${ templateVariableName ( nestedCompType . type )}''';
}
