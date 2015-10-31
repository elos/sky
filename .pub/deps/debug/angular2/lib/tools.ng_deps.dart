library angular2.tools.ng_deps.dart;

import 'tools.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/tools/tools.ng_deps.dart' as i0;
export 'tools.dart';
export 'package:angular2/src/tools/tools.dart' show enableDebugTools, disableDebugTools;
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
}
