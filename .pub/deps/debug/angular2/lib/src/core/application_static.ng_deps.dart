library angular2.src.core.application_static.ng_deps.dart;

import 'application_static.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'dart:async';
import 'application_common.dart';
import 'application_common.ng_deps.dart' as i1;
import 'package:angular2/src/core/linker/dynamic_component_loader.dart' show ComponentRef;
import 'package:angular2/src/core/linker/dynamic_component_loader.ng_deps.dart' as i2;
export 'application_static.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i1.initReflector();
i2.initReflector();
}
