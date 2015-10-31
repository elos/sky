library angular2.src.core.compiler.command_compiler;

import "package:angular2/src/core/facade/lang.dart"
    show isPresent, isBlank, Type, isString, StringWrapper;
import "package:angular2/src/core/facade/collection.dart"
    show SetWrapper, StringMapWrapper, ListWrapper;
import "package:angular2/src/core/linker/template_commands.dart"
    show
        TemplateCmd,
        text,
        ngContent,
        beginElement,
        endElement,
        beginComponent,
        endComponent,
        embeddedTemplate,
        CompiledTemplate;
import "template_ast.dart"
    show
        TemplateAst,
        TemplateAstVisitor,
        NgContentAst,
        EmbeddedTemplateAst,
        ElementAst,
        VariableAst,
        BoundEventAst,
        BoundElementPropertyAst,
        AttrAst,
        BoundTextAst,
        TextAst,
        DirectiveAst,
        BoundDirectivePropertyAst,
        templateVisitAll;
import "directive_metadata.dart"
    show CompileTypeMetadata, CompileDirectiveMetadata;
import "source_module.dart" show SourceExpressions, SourceExpression, moduleRef;
import "package:angular2/src/core/metadata/view.dart" show ViewEncapsulation;
import "style_compiler.dart"
    show
        shimHostAttribute,
        shimContentAttribute,
        shimContentAttributeExpr,
        shimHostAttributeExpr;
import "util.dart" show escapeSingleQuoteString, MODULE_SUFFIX;
import "package:angular2/src/core/di.dart" show Injectable;

var TEMPLATE_COMMANDS_MODULE_REF = moduleRef(
    '''package:angular2/src/core/linker/template_commands${ MODULE_SUFFIX}''');
const IMPLICIT_TEMPLATE_VAR = "\$implicit";
const CLASS_ATTR = "class";
const STYLE_ATTR = "style";

@Injectable()
class CommandCompiler {
  List<TemplateCmd> compileComponentRuntime(
      CompileDirectiveMetadata component,
      String appId,
      num templateId,
      List<TemplateAst> template,
      List<Function> changeDetectorFactories,
      Function componentTemplateFactory) {
    var visitor = new CommandBuilderVisitor(
        new RuntimeCommandFactory(component, appId, templateId,
            componentTemplateFactory, changeDetectorFactories),
        0);
    templateVisitAll(visitor, template);
    return visitor.result;
  }

  SourceExpression compileComponentCodeGen(
      CompileDirectiveMetadata component,
      String appIdExpr,
      String templateIdExpr,
      List<TemplateAst> template,
      List<String> changeDetectorFactoryExpressions,
      Function componentTemplateFactory) {
    var visitor = new CommandBuilderVisitor(
        new CodegenCommandFactory(component, appIdExpr, templateIdExpr,
            componentTemplateFactory, changeDetectorFactoryExpressions),
        0);
    templateVisitAll(visitor, template);
    var source = '''[${ visitor . result . join ( "," )}]''';
    return new SourceExpression([], source);
  }
}

abstract class CommandFactory<R> {
  R createText(String value, bool isBound, num ngContentIndex);
  R createNgContent(num index, num ngContentIndex);
  R createBeginElement(
      String name,
      List<String> attrNameAndValues,
      List<String> eventTargetAndNames,
      List<String> variableNameAndValues,
      List<CompileDirectiveMetadata> directives,
      bool isBound,
      num ngContentIndex);
  R createEndElement();
  R createBeginComponent(
      String name,
      List<String> attrNameAndValues,
      List<String> eventTargetAndNames,
      List<String> variableNameAndValues,
      List<CompileDirectiveMetadata> directives,
      bool nativeShadow,
      num ngContentIndex);
  R createEndComponent();
  R createEmbeddedTemplate(
      num embeddedTemplateIndex,
      List<String> attrNameAndValues,
      List<String> variableNameAndValues,
      List<CompileDirectiveMetadata> directives,
      bool isMerged,
      num ngContentIndex,
      List<R> children);
}

class RuntimeCommandFactory implements CommandFactory<TemplateCmd> {
  CompileDirectiveMetadata component;
  String appId;
  num templateId;
  Function componentTemplateFactory;
  List<Function> changeDetectorFactories;
  RuntimeCommandFactory(this.component, this.appId, this.templateId,
      this.componentTemplateFactory, this.changeDetectorFactories) {}
  List<Type> _mapDirectives(List<CompileDirectiveMetadata> directives) {
    return directives.map((directive) => directive.type.runtime).toList();
  }

  List<String> _addStyleShimAttributes(List<String> attrNameAndValues,
      CompileDirectiveMetadata localComponent, num localTemplateId) {
    var additionalStyles = [];
    if (isPresent(localComponent) &&
        identical(localComponent.template.encapsulation,
            ViewEncapsulation.Emulated)) {
      additionalStyles.add(shimHostAttribute(this.appId, localTemplateId));
      additionalStyles.add("");
    }
    if (identical(
        this.component.template.encapsulation, ViewEncapsulation.Emulated)) {
      additionalStyles.add(shimContentAttribute(this.appId, this.templateId));
      additionalStyles.add("");
    }
    return (new List.from(additionalStyles)..addAll(attrNameAndValues));
  }

  TemplateCmd createText(String value, bool isBound, num ngContentIndex) {
    return text(value, isBound, ngContentIndex);
  }

  TemplateCmd createNgContent(num index, num ngContentIndex) {
    return ngContent(index, ngContentIndex);
  }

  TemplateCmd createBeginElement(
      String name,
      List<String> attrNameAndValues,
      List<String> eventTargetAndNames,
      List<String> variableNameAndValues,
      List<CompileDirectiveMetadata> directives,
      bool isBound,
      num ngContentIndex) {
    return beginElement(
        name,
        this._addStyleShimAttributes(attrNameAndValues, null, null),
        eventTargetAndNames,
        variableNameAndValues,
        this._mapDirectives(directives),
        isBound,
        ngContentIndex);
  }

  TemplateCmd createEndElement() {
    return endElement();
  }

  TemplateCmd createBeginComponent(
      String name,
      List<String> attrNameAndValues,
      List<String> eventTargetAndNames,
      List<String> variableNameAndValues,
      List<CompileDirectiveMetadata> directives,
      bool nativeShadow,
      num ngContentIndex) {
    var nestedTemplate = this.componentTemplateFactory(directives[0]);
    return beginComponent(
        name,
        this._addStyleShimAttributes(
            attrNameAndValues, directives[0], nestedTemplate.id),
        eventTargetAndNames,
        variableNameAndValues,
        this._mapDirectives(directives),
        nativeShadow,
        ngContentIndex,
        nestedTemplate);
  }

  TemplateCmd createEndComponent() {
    return endComponent();
  }

  TemplateCmd createEmbeddedTemplate(
      num embeddedTemplateIndex,
      List<String> attrNameAndValues,
      List<String> variableNameAndValues,
      List<CompileDirectiveMetadata> directives,
      bool isMerged,
      num ngContentIndex,
      List<TemplateCmd> children) {
    return embeddedTemplate(
        attrNameAndValues,
        variableNameAndValues,
        this._mapDirectives(directives),
        isMerged,
        ngContentIndex,
        this.changeDetectorFactories[embeddedTemplateIndex],
        children);
  }
}

class CodegenCommandFactory implements CommandFactory<String> {
  CompileDirectiveMetadata component;
  String appIdExpr;
  String templateIdExpr;
  Function componentTemplateFactory;
  List<String> changeDetectorFactoryExpressions;
  CodegenCommandFactory(this.component, this.appIdExpr, this.templateIdExpr,
      this.componentTemplateFactory, this.changeDetectorFactoryExpressions) {}
  List<dynamic> _addStyleShimAttributes(List<String> attrNameAndValues,
      CompileDirectiveMetadata localComponent, String localTemplateIdExpr) {
    var additionalStlyes = [];
    if (isPresent(localComponent) &&
        identical(localComponent.template.encapsulation,
            ViewEncapsulation.Emulated)) {
      additionalStlyes.add(new Expression(
          shimHostAttributeExpr(this.appIdExpr, localTemplateIdExpr)));
      additionalStlyes.add("");
    }
    if (identical(
        this.component.template.encapsulation, ViewEncapsulation.Emulated)) {
      additionalStlyes.add(new Expression(
          shimContentAttributeExpr(this.appIdExpr, this.templateIdExpr)));
      additionalStlyes.add("");
    }
    return (new List.from(additionalStlyes)..addAll(attrNameAndValues));
  }

  String createText(String value, bool isBound, num ngContentIndex) {
    return '''${ TEMPLATE_COMMANDS_MODULE_REF}text(${ escapeSingleQuoteString ( value )}, ${ isBound}, ${ ngContentIndex})''';
  }

  String createNgContent(num index, num ngContentIndex) {
    return '''${ TEMPLATE_COMMANDS_MODULE_REF}ngContent(${ index}, ${ ngContentIndex})''';
  }

  String createBeginElement(
      String name,
      List<String> attrNameAndValues,
      List<String> eventTargetAndNames,
      List<String> variableNameAndValues,
      List<CompileDirectiveMetadata> directives,
      bool isBound,
      num ngContentIndex) {
    var attrsExpression = codeGenArray(
        this._addStyleShimAttributes(attrNameAndValues, null, null));
    return '''${ TEMPLATE_COMMANDS_MODULE_REF}beginElement(${ escapeSingleQuoteString ( name )}, ${ attrsExpression}, ${ codeGenArray ( eventTargetAndNames )}, ${ codeGenArray ( variableNameAndValues )}, ${ codeGenDirectivesArray ( directives )}, ${ isBound}, ${ ngContentIndex})''';
  }

  String createEndElement() {
    return '''${ TEMPLATE_COMMANDS_MODULE_REF}endElement()''';
  }

  String createBeginComponent(
      String name,
      List<String> attrNameAndValues,
      List<String> eventTargetAndNames,
      List<String> variableNameAndValues,
      List<CompileDirectiveMetadata> directives,
      bool nativeShadow,
      num ngContentIndex) {
    var nestedCompExpr = this.componentTemplateFactory(directives[0]);
    var attrsExpression = codeGenArray(this._addStyleShimAttributes(
        attrNameAndValues, directives[0], '''${ nestedCompExpr}.id'''));
    return '''${ TEMPLATE_COMMANDS_MODULE_REF}beginComponent(${ escapeSingleQuoteString ( name )}, ${ attrsExpression}, ${ codeGenArray ( eventTargetAndNames )}, ${ codeGenArray ( variableNameAndValues )}, ${ codeGenDirectivesArray ( directives )}, ${ nativeShadow}, ${ ngContentIndex}, ${ nestedCompExpr})''';
  }

  String createEndComponent() {
    return '''${ TEMPLATE_COMMANDS_MODULE_REF}endComponent()''';
  }

  String createEmbeddedTemplate(
      num embeddedTemplateIndex,
      List<String> attrNameAndValues,
      List<String> variableNameAndValues,
      List<CompileDirectiveMetadata> directives,
      bool isMerged,
      num ngContentIndex,
      List<String> children) {
    return '''${ TEMPLATE_COMMANDS_MODULE_REF}embeddedTemplate(${ codeGenArray ( attrNameAndValues )}, ${ codeGenArray ( variableNameAndValues )}, ''' +
        '''${ codeGenDirectivesArray ( directives )}, ${ isMerged}, ${ ngContentIndex}, ${ this . changeDetectorFactoryExpressions [ embeddedTemplateIndex ]}, [${ children . join ( "," )}])''';
  }
}

dynamic visitAndReturnContext(
    TemplateAstVisitor visitor, List<TemplateAst> asts, dynamic context) {
  templateVisitAll(visitor, asts, context);
  return context;
}

class CommandBuilderVisitor<R> implements TemplateAstVisitor {
  CommandFactory<R> commandFactory;
  num embeddedTemplateIndex;
  List<R> result = [];
  num transitiveNgContentCount = 0;
  CommandBuilderVisitor(this.commandFactory, this.embeddedTemplateIndex) {}
  List<String> _readAttrNameAndValues(
      List<CompileDirectiveMetadata> directives, List<TemplateAst> attrAsts) {
    var attrs = keyValueArrayToMap(visitAndReturnContext(this, attrAsts, []));
    directives.forEach((directiveMeta) {
      StringMapWrapper.forEach(directiveMeta.hostAttributes, (value, name) {
        var prevValue = attrs[name];
        attrs[name] = isPresent(prevValue)
            ? mergeAttributeValue(name, prevValue, value)
            : value;
      });
    });
    return mapToKeyValueArray(attrs);
  }

  dynamic visitNgContent(NgContentAst ast, dynamic context) {
    this.transitiveNgContentCount++;
    this.result.add(
        this.commandFactory.createNgContent(ast.index, ast.ngContentIndex));
    return null;
  }

  dynamic visitEmbeddedTemplate(EmbeddedTemplateAst ast, dynamic context) {
    this.embeddedTemplateIndex++;
    var childVisitor = new CommandBuilderVisitor(
        this.commandFactory, this.embeddedTemplateIndex);
    templateVisitAll(childVisitor, ast.children);
    var isMerged = childVisitor.transitiveNgContentCount > 0;
    var variableNameAndValues = [];
    ast.vars.forEach((varAst) {
      variableNameAndValues.add(varAst.name);
      variableNameAndValues
          .add(varAst.value.length > 0 ? varAst.value : IMPLICIT_TEMPLATE_VAR);
    });
    var directives = [];
    ListWrapper.forEachWithIndex(ast.directives,
        (DirectiveAst directiveAst, num index) {
      directiveAst.visit(this, new DirectiveContext(index, [], [], directives));
    });
    this.result.add(this.commandFactory.createEmbeddedTemplate(
        this.embeddedTemplateIndex,
        this._readAttrNameAndValues(directives, ast.attrs),
        variableNameAndValues,
        directives,
        isMerged,
        ast.ngContentIndex,
        childVisitor.result));
    this.transitiveNgContentCount += childVisitor.transitiveNgContentCount;
    this.embeddedTemplateIndex = childVisitor.embeddedTemplateIndex;
    return null;
  }

  dynamic visitElement(ElementAst ast, dynamic context) {
    var component = ast.getComponent();
    var eventTargetAndNames = visitAndReturnContext(this, ast.outputs, []);
    var variableNameAndValues = [];
    if (isBlank(component)) {
      ast.exportAsVars.forEach((varAst) {
        variableNameAndValues.add(varAst.name);
        variableNameAndValues.add(null);
      });
    }
    var directives = [];
    ListWrapper.forEachWithIndex(ast.directives,
        (DirectiveAst directiveAst, num index) {
      directiveAst.visit(
          this,
          new DirectiveContext(
              index, eventTargetAndNames, variableNameAndValues, directives));
    });
    eventTargetAndNames = removeKeyValueArrayDuplicates(eventTargetAndNames);
    var attrNameAndValues = this._readAttrNameAndValues(directives, ast.attrs);
    if (isPresent(component)) {
      this.result.add(this.commandFactory.createBeginComponent(
          ast.name,
          attrNameAndValues,
          eventTargetAndNames,
          variableNameAndValues,
          directives,
          identical(component.template.encapsulation, ViewEncapsulation.Native),
          ast.ngContentIndex));
      templateVisitAll(this, ast.children);
      this.result.add(this.commandFactory.createEndComponent());
    } else {
      this.result.add(this.commandFactory.createBeginElement(
          ast.name,
          attrNameAndValues,
          eventTargetAndNames,
          variableNameAndValues,
          directives,
          ast.isBound(),
          ast.ngContentIndex));
      templateVisitAll(this, ast.children);
      this.result.add(this.commandFactory.createEndElement());
    }
    return null;
  }

  dynamic visitVariable(VariableAst ast, dynamic ctx) {
    return null;
  }

  dynamic visitAttr(AttrAst ast, List<String> attrNameAndValues) {
    attrNameAndValues.add(ast.name);
    attrNameAndValues.add(ast.value);
    return null;
  }

  dynamic visitBoundText(BoundTextAst ast, dynamic context) {
    this
        .result
        .add(this.commandFactory.createText(null, true, ast.ngContentIndex));
    return null;
  }

  dynamic visitText(TextAst ast, dynamic context) {
    this.result.add(
        this.commandFactory.createText(ast.value, false, ast.ngContentIndex));
    return null;
  }

  dynamic visitDirective(DirectiveAst ast, DirectiveContext ctx) {
    ctx.targetDirectives.add(ast.directive);
    templateVisitAll(this, ast.hostEvents, ctx.eventTargetAndNames);
    ast.exportAsVars.forEach((varAst) {
      ctx.targetVariableNameAndValues.add(varAst.name);
      ctx.targetVariableNameAndValues.add(ctx.index);
    });
    return null;
  }

  dynamic visitEvent(BoundEventAst ast, List<String> eventTargetAndNames) {
    eventTargetAndNames.add(ast.target);
    eventTargetAndNames.add(ast.name);
    return null;
  }

  dynamic visitDirectiveProperty(
      BoundDirectivePropertyAst ast, dynamic context) {
    return null;
  }

  dynamic visitElementProperty(BoundElementPropertyAst ast, dynamic context) {
    return null;
  }
}

List<String> removeKeyValueArrayDuplicates(List<String> keyValueArray) {
  var knownPairs = new Set();
  var resultKeyValueArray = [];
  for (var i = 0; i < keyValueArray.length; i += 2) {
    var key = keyValueArray[i];
    var value = keyValueArray[i + 1];
    var pairId = '''${ key}:${ value}''';
    if (!SetWrapper.has(knownPairs, pairId)) {
      resultKeyValueArray.add(key);
      resultKeyValueArray.add(value);
      knownPairs.add(pairId);
    }
  }
  return resultKeyValueArray;
}

Map<String, String> keyValueArrayToMap(List<String> keyValueArr) {
  Map<String, String> data = {};
  for (var i = 0; i < keyValueArr.length; i += 2) {
    data[keyValueArr[i]] = keyValueArr[i + 1];
  }
  return data;
}

List<String> mapToKeyValueArray(Map<String, String> data) {
  var entryArray = [];
  StringMapWrapper.forEach(data, (value, name) {
    entryArray.add([name, value]);
  });
  // We need to sort to get a defined output order

  // for tests and for caching generated artifacts...
  ListWrapper.sort(entryArray,
      (entry1, entry2) => StringWrapper.compare(entry1[0], entry2[0]));
  var keyValueArray = [];
  entryArray.forEach((entry) {
    keyValueArray.add(entry[0]);
    keyValueArray.add(entry[1]);
  });
  return keyValueArray;
}

String mergeAttributeValue(
    String attrName, String attrValue1, String attrValue2) {
  if (attrName == CLASS_ATTR || attrName == STYLE_ATTR) {
    return '''${ attrValue1} ${ attrValue2}''';
  } else {
    return attrValue2;
  }
}

class DirectiveContext {
  num index;
  List<String> eventTargetAndNames;
  List<dynamic> targetVariableNameAndValues;
  List<CompileDirectiveMetadata> targetDirectives;
  DirectiveContext(this.index, this.eventTargetAndNames,
      this.targetVariableNameAndValues, this.targetDirectives) {}
}

class Expression {
  String value;
  Expression(this.value) {}
}

String escapeValue(dynamic value) {
  if (value is Expression) {
    return value.value;
  } else if (isString(value)) {
    return escapeSingleQuoteString(value);
  } else if (isBlank(value)) {
    return "null";
  } else {
    return '''${ value}''';
  }
}

String codeGenArray(List<dynamic> data) {
  return '''[${ data . map ( escapeValue ) . toList ( ) . join ( "," )}]''';
}

String codeGenDirectivesArray(List<CompileDirectiveMetadata> directives) {
  var expressions = directives
      .map((directiveType) =>
          '''${ moduleRef ( directiveType . type . moduleUrl )}${ directiveType . type . name}''')
      .toList();
  return '''[${ expressions . join ( "," )}]''';
}
