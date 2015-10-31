library angular2.bootstrap_static.ng_deps.dart;

import 'bootstrap_static.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'src/core/application_static.ng_deps.dart' as i0;
export 'bootstrap_static.dart';
export 'src/core/application_static.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
}
