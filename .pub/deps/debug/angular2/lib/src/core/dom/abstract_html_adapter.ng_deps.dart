library angular2.dom.abstractHtmlAdapter.ng_deps.dart;

import 'abstract_html_adapter.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart';
import 'dom_adapter.dart';
import 'dom_adapter.ng_deps.dart' as i2;
import 'emulated_css.dart';
import 'emulated_css.ng_deps.dart' as i3;
import '../compiler/xhr.dart';
import '../compiler/xhr.ng_deps.dart' as i4;
export 'abstract_html_adapter.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i2.initReflector();
i3.initReflector();
i4.initReflector();
}
