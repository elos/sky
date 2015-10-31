library angular2.src.core.bootstrap.ng_deps.dart;

import 'bootstrap.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import './application.ng_deps.dart' as i0;
export 'bootstrap.dart';
export './application.dart' show bootstrap;
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
}
