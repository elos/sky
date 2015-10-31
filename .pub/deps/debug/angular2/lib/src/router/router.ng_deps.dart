library angular2.src.router.router.ng_deps.dart;

import 'router.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/facade/async.dart' show Future, PromiseWrapper, EventEmitter, ObservableWrapper;
import 'package:angular2/src/core/facade/async.ng_deps.dart' as i0;
import 'package:angular2/src/core/facade/collection.dart' show Map, StringMapWrapper, MapWrapper, ListWrapper;
import 'package:angular2/src/core/facade/lang.dart' show isBlank, isString, StringWrapper, isPresent, Type, isArray;
import 'package:angular2/src/core/facade/exceptions.dart' show BaseException, WrappedException;
import 'package:angular2/src/core/facade/exceptions.ng_deps.dart' as i3;
import 'route_registry.dart' show RouteRegistry;
import 'route_registry.ng_deps.dart' as i4;
import 'instruction.dart' show ComponentInstruction, Instruction, stringifyInstruction, stringifyInstructionPath, stringifyInstructionQuery;
import 'instruction.ng_deps.dart' as i5;
import 'router_outlet.dart' show RouterOutlet;
import 'router_outlet.ng_deps.dart' as i6;
import 'location.dart' show Location;
import 'location.ng_deps.dart' as i7;
import 'route_lifecycle_reflector.dart' show getCanActivateHook;
import 'route_lifecycle_reflector.ng_deps.dart' as i8;
import 'route_config_impl.dart' show RouteDefinition;
import 'route_config_impl.ng_deps.dart' as i9;
export 'router.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i3.initReflector();
i4.initReflector();
i5.initReflector();
i6.initReflector();
i7.initReflector();
i8.initReflector();
i9.initReflector();
}
