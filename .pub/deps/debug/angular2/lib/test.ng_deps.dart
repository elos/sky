library angular2.test.ng_deps.dart;

import 'test.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'testing.ng_deps.dart' as i0;
export 'test.dart';
export 'testing.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
}
