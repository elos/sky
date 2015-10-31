library angular2.src.core.compiler.util;

import "package:angular2/src/core/facade/lang.dart"
    show StringWrapper, isBlank, isJsObject;

var CAMEL_CASE_REGEXP = new RegExp(r'([A-Z])');
var DASH_CASE_REGEXP = new RegExp(r'-([a-z])');
var SINGLE_QUOTE_ESCAPE_STRING_RE = new RegExp(r'' + "'" + r'|\\|\n|\$');
var DOUBLE_QUOTE_ESCAPE_STRING_RE = new RegExp(r'"|\\|\n|\$');
var IS_DART = !isJsObject({});
var MODULE_SUFFIX = IS_DART ? ".dart" : ".js";
String camelCaseToDashCase(String input) {
  return StringWrapper.replaceAllMapped(input, CAMEL_CASE_REGEXP, (m) {
    return "-" + m[1].toLowerCase();
  });
}

String dashCaseToCamelCase(String input) {
  return StringWrapper.replaceAllMapped(input, DASH_CASE_REGEXP, (m) {
    return m[1].toUpperCase();
  });
}

String escapeSingleQuoteString(String input) {
  if (isBlank(input)) {
    return null;
  }
  return '''\'${ escapeString ( input , SINGLE_QUOTE_ESCAPE_STRING_RE )}\'''';
}

String escapeDoubleQuoteString(String input) {
  if (isBlank(input)) {
    return null;
  }
  return '''"${ escapeString ( input , DOUBLE_QUOTE_ESCAPE_STRING_RE )}"''';
}

String escapeString(String input, RegExp re) {
  return StringWrapper.replaceAllMapped(input, re, (match) {
    if (match[0] == "\$") {
      return IS_DART ? "\\\$" : "\$";
    } else if (match[0] == "\n") {
      return "\\n";
    } else {
      return '''\\${ match [ 0 ]}''';
    }
  });
}

String codeGenExportVariable(String name, [bool isConst = false]) {
  var declaration =
      IS_DART && isConst ? '''const ${ name}''' : '''var ${ name}''';
  return IS_DART
      ? '''${ declaration} = '''
      : '''${ declaration} = exports[\'${ name}\'] = ''';
}

String codeGenConcatArray(String expression) {
  return '''${ IS_DART ? "..addAll" : ".concat"}(${ expression})''';
}

String codeGenMapArray(List<String> argNames, String callback) {
  if (IS_DART) {
    return '''.map( (${ argNames . join ( "," )}) => ${ callback} ).toList()''';
  } else {
    return '''.map(function(${ argNames . join ( "," )}) { return ${ callback}; })''';
  }
}

String codeGenReplaceAll(String pattern, String expression) {
  if (IS_DART) {
    return '''.replaceAll(\'${ pattern}\', ${ expression})''';
  } else {
    return '''.replace(/${ pattern}/g, ${ expression})''';
  }
}

String codeGenValueFn(List<String> params, String value, [String fnName = ""]) {
  if (IS_DART) {
    return '''${ fnName}(${ params . join ( "," )}) => ${ value}''';
  } else {
    return '''function ${ fnName}(${ params . join ( "," )}) { return ${ value}; }''';
  }
}

String codeGenToString(String expr) {
  if (IS_DART) {
    return '''\'\${${ expr}}\'''';
  } else {
    // JS automatically convets to string...
    return expr;
  }
}

List<String> splitAtColon(String input, List<String> defaultValues) {
  var parts = StringWrapper.split(input.trim(), new RegExp(r'\s*:\s*'));
  if (parts.length > 1) {
    return parts;
  } else {
    return defaultValues;
  }
}
