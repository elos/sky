library angular2.src.core.debug.ng_deps.dart;

import 'debug.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'debug/debug_element.ng_deps.dart' as i0;
import 'debug/debug_element_view_listener.ng_deps.dart' as i1;
export 'debug.dart';
export 'debug/debug_element.dart' show DebugElement, asNativeElements, By, Scope, inspectElement;
export 'debug/debug_element_view_listener.dart' show inspectNativeElement, ELEMENT_PROBE_PROVIDERS, ELEMENT_PROBE_BINDINGS;
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
}
