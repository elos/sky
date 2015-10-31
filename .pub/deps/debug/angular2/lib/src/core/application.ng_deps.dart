library angular2.src.core.application.ng_deps.dart;

import 'application.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'dart:async';
import 'package:angular2/src/core/reflection/reflection.dart' show reflector;
import 'package:angular2/src/core/reflection/reflection.ng_deps.dart' as i1;
import 'package:angular2/src/core/reflection/reflection_capabilities.dart' show ReflectionCapabilities;
import 'package:angular2/src/core/reflection/reflection_capabilities.ng_deps.dart' as i2;
import 'application_common.dart';
import 'application_common.ng_deps.dart' as i3;
import 'package:angular2/src/core/compiler/compiler.dart';
import 'package:angular2/src/core/compiler/compiler.ng_deps.dart' as i4;
import 'package:angular2/src/core/linker/dynamic_component_loader.dart';
import 'package:angular2/src/core/linker/dynamic_component_loader.ng_deps.dart' as i5;
export 'application.dart';
export 'package:angular2/src/core/linker/dynamic_component_loader.dart' show ComponentRef;
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
i5.initReflector();
}
