library angular2.src.core.compiler.html_parser.ng_deps.dart;

import 'html_parser.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/facade/lang.dart' show isPresent, StringWrapper, stringify, assertionsEnabled, StringJoiner;
import 'package:angular2/src/core/dom/dom_adapter.dart' show DOM;
import 'package:angular2/src/core/dom/dom_adapter.ng_deps.dart' as i1;
import 'html_ast.dart' show HtmlAst, HtmlAttrAst, HtmlTextAst, HtmlElementAst, HtmlAstVisitor, htmlVisitAll;
import 'html_ast.ng_deps.dart' as i2;
import 'util.dart' show escapeDoubleQuoteString;
import 'util.ng_deps.dart' as i3;
import 'package:angular2/src/core/di.dart' show Injectable;
import 'package:angular2/src/core/di.ng_deps.dart' as i4;
export 'html_parser.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(HtmlParser, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [],
() => new HtmlParser())
)
;
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
}
