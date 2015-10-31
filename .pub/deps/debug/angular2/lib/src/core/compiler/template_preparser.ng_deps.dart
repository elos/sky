library angular2.src.core.compiler.template_preparser.ng_deps.dart;

import 'template_preparser.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'html_ast.dart' show HtmlElementAst;
import 'html_ast.ng_deps.dart' as i0;
import 'package:angular2/src/core/facade/lang.dart' show isBlank, isPresent;
export 'template_preparser.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
}
