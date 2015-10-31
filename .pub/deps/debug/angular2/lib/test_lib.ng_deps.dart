library angular2.test_lib.ng_deps.dart;

import 'test_lib.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'testing_internal.ng_deps.dart' as i0;
export 'test_lib.dart';
export 'testing_internal.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
}
