library angular2.render.ng_deps.dart;

import 'render.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'src/core/render.ng_deps.dart' as i0;
export 'render.dart';
export 'src/core/render.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
}
