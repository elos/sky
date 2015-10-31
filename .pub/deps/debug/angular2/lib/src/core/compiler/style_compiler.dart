library angular2.src.core.compiler.style_compiler;

import "directive_metadata.dart"
    show CompileTypeMetadata, CompileTemplateMetadata;
import "source_module.dart" show SourceModule, SourceExpression, moduleRef;
import "package:angular2/src/core/metadata/view.dart" show ViewEncapsulation;
import "package:angular2/src/core/compiler/xhr.dart" show XHR;
import "package:angular2/src/core/facade/lang.dart" show StringWrapper, isBlank;
import "package:angular2/src/core/facade/async.dart"
    show PromiseWrapper, Future;
import "package:angular2/src/core/compiler/shadow_css.dart" show ShadowCss;
import "package:angular2/src/core/compiler/url_resolver.dart" show UrlResolver;
import "style_url_resolver.dart" show extractStyleUrls;
import "util.dart"
    show
        escapeSingleQuoteString,
        IS_DART,
        codeGenConcatArray,
        codeGenMapArray,
        codeGenReplaceAll,
        codeGenExportVariable,
        codeGenToString,
        MODULE_SUFFIX;
import "package:angular2/src/core/di.dart" show Injectable;

const COMPONENT_VARIABLE = "%COMP%";
var COMPONENT_REGEX = new RegExp(r'%COMP%');
const HOST_ATTR = '''_nghost-${ COMPONENT_VARIABLE}''';
const HOST_ATTR_EXPR = '''\'_nghost-\'+${ COMPONENT_VARIABLE}''';
const CONTENT_ATTR = '''_ngcontent-${ COMPONENT_VARIABLE}''';
const CONTENT_ATTR_EXPR = '''\'_ngcontent-\'+${ COMPONENT_VARIABLE}''';

@Injectable()
class StyleCompiler {
  XHR _xhr;
  UrlResolver _urlResolver;
  Map<String, Future<List<String>>> _styleCache =
      new Map<String, Future<List<String>>>();
  ShadowCss _shadowCss = new ShadowCss();
  StyleCompiler(this._xhr, this._urlResolver) {}
  Future<List<String>> compileComponentRuntime(
      String appId, num templateId, CompileTemplateMetadata template) {
    var styles = template.styles;
    var styleAbsUrls = template.styleUrls;
    return this
        ._loadStyles(styles, styleAbsUrls,
            identical(template.encapsulation, ViewEncapsulation.Emulated))
        .then((styles) => styles
            .map((style) => StringWrapper.replaceAll(
                style, COMPONENT_REGEX, componentId(appId, templateId)))
            .toList());
  }

  SourceExpression compileComponentCodeGen(String appIdExpression,
      String templateIdExpression, CompileTemplateMetadata template) {
    var shim = identical(template.encapsulation, ViewEncapsulation.Emulated);
    var suffix;
    if (shim) {
      suffix = codeGenMapArray([
        "style"
      ], '''style${ codeGenReplaceAll ( COMPONENT_VARIABLE , componentIdExpression ( appIdExpression , templateIdExpression ) )}''');
    } else {
      suffix = "";
    }
    return this
        ._styleCodeGen(template.styles, template.styleUrls, shim, suffix);
  }

  List<SourceModule> compileStylesheetCodeGen(
      String stylesheetUrl, String cssText) {
    var styleWithImports =
        extractStyleUrls(this._urlResolver, stylesheetUrl, cssText);
    return [
      this._styleModule(
          stylesheetUrl,
          false,
          this._styleCodeGen(
              [styleWithImports.style], styleWithImports.styleUrls, false, "")),
      this._styleModule(
          stylesheetUrl,
          true,
          this._styleCodeGen(
              [styleWithImports.style], styleWithImports.styleUrls, true, ""))
    ];
  }

  clearCache() {
    this._styleCache.clear();
  }

  Future<List<String>> _loadStyles(
      List<String> plainStyles, List<String> absUrls, bool encapsulate) {
    var promises = absUrls.map((absUrl) {
      var cacheKey = '''${ absUrl}${ encapsulate ? ".shim" : ""}''';
      var result = this._styleCache[cacheKey];
      if (isBlank(result)) {
        result = this._xhr.get(absUrl).then((style) {
          var styleWithImports =
              extractStyleUrls(this._urlResolver, absUrl, style);
          return this._loadStyles([styleWithImports.style],
              styleWithImports.styleUrls, encapsulate);
        });
        this._styleCache[cacheKey] = result;
      }
      return result;
    }).toList();
    return PromiseWrapper.all(promises).then((List<List<String>> nestedStyles) {
      var result = plainStyles
          .map((plainStyle) => this._shimIfNeeded(plainStyle, encapsulate))
          .toList();
      nestedStyles
          .forEach((styles) => styles.forEach((style) => result.add(style)));
      return result;
    });
  }

  SourceExpression _styleCodeGen(List<String> plainStyles, List<String> absUrls,
      bool shim, String suffix) {
    var expressionSource = '''(''';
    expressionSource +=
        '''[${ plainStyles . map ( ( plainStyle ) => escapeSingleQuoteString ( this . _shimIfNeeded ( plainStyle , shim ) ) ) . toList ( ) . join ( "," )}]''';
    for (var i = 0; i < absUrls.length; i++) {
      var moduleUrl = this._createModuleUrl(absUrls[i], shim);
      expressionSource +=
          codeGenConcatArray('''${ moduleRef ( moduleUrl )}STYLES''');
    }
    expressionSource += ''')${ suffix}''';
    return new SourceExpression([], expressionSource);
  }

  SourceModule _styleModule(
      String stylesheetUrl, bool shim, SourceExpression expression) {
    var moduleSource = '''
      ${ expression . declarations . join ( "\n" )}
      ${ codeGenExportVariable ( "STYLES" )}${ expression . expression};
    ''';
    return new SourceModule(
        this._createModuleUrl(stylesheetUrl, shim), moduleSource);
  }

  String _shimIfNeeded(String style, bool shim) {
    return shim
        ? this._shadowCss.shimCssText(style, CONTENT_ATTR, HOST_ATTR)
        : style;
  }

  String _createModuleUrl(String stylesheetUrl, bool shim) {
    return shim
        ? '''${ stylesheetUrl}.shim${ MODULE_SUFFIX}'''
        : '''${ stylesheetUrl}${ MODULE_SUFFIX}''';
  }
}

String shimContentAttribute(String appId, num templateId) {
  return StringWrapper.replaceAll(
      CONTENT_ATTR, COMPONENT_REGEX, componentId(appId, templateId));
}

String shimContentAttributeExpr(String appIdExpr, String templateIdExpr) {
  return StringWrapper.replaceAll(CONTENT_ATTR_EXPR, COMPONENT_REGEX,
      componentIdExpression(appIdExpr, templateIdExpr));
}

String shimHostAttribute(String appId, num templateId) {
  return StringWrapper.replaceAll(
      HOST_ATTR, COMPONENT_REGEX, componentId(appId, templateId));
}

String shimHostAttributeExpr(String appIdExpr, String templateIdExpr) {
  return StringWrapper.replaceAll(HOST_ATTR_EXPR, COMPONENT_REGEX,
      componentIdExpression(appIdExpr, templateIdExpr));
}

String componentId(String appId, num templateId) {
  return '''${ appId}-${ templateId}''';
}

String componentIdExpression(
    String appIdExpression, String templateIdExpression) {
  return '''${ appIdExpression}+\'-\'+${ codeGenToString ( templateIdExpression )}''';
}
