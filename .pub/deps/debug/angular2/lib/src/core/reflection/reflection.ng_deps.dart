library reflection.reflection.ng_deps.dart;

import 'reflection.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'reflector.dart';
import 'reflector.ng_deps.dart' as i0;
import 'types.dart';
import 'platform_reflection_capabilities.dart';
import 'platform_reflection_capabilities.ng_deps.dart' as i2;
import 'package:angular2/src/core/facade/lang.dart';
export 'reflection.dart';
export 'reflector.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i2.initReflector();
}
