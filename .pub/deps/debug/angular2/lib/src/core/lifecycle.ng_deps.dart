library angular2.src.core.lifecycle.ng_deps.dart;

import 'lifecycle.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'life_cycle/life_cycle.ng_deps.dart' as i0;
export 'lifecycle.dart';
export 'life_cycle/life_cycle.dart' show LifeCycle;
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
}
