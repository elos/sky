library angular2.src.core.metadata.di.ng_deps.dart;

import 'di.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/facade/lang.dart' show Type, stringify, isPresent, StringWrapper, isString;
import 'package:angular2/src/core/di.dart' show resolveForwardRef;
import 'package:angular2/src/core/di.ng_deps.dart' as i1;
import 'package:angular2/src/core/di/metadata.dart' show DependencyMetadata;
import 'package:angular2/src/core/di/metadata.ng_deps.dart' as i2;
export 'di.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i1.initReflector();
i2.initReflector();
}
