library testability.browser_testability.ng_deps.dart;

import 'browser_testability.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import './testability.dart';
import './testability.ng_deps.dart' as i0;
import 'dart:html';
import 'dart:js' as js;
export 'browser_testability.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
}
