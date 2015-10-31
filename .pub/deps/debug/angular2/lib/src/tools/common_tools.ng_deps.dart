library angular2.src.tools.common_tools.ng_deps.dart;

import 'common_tools.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/angular2.dart' show LifeCycle;
import 'package:angular2/angular2.ng_deps.dart' as i0;
import 'package:angular2/src/core/linker/dynamic_component_loader.dart' show ComponentRef, ComponentRef_;
import 'package:angular2/src/core/linker/dynamic_component_loader.ng_deps.dart' as i1;
import 'package:angular2/src/core/facade/lang.dart' show isPresent, NumberWrapper;
import 'package:angular2/src/core/facade/browser.dart' show performance, window;
import 'package:angular2/src/core/dom/dom_adapter.dart' show DOM;
import 'package:angular2/src/core/dom/dom_adapter.ng_deps.dart' as i4;
export 'common_tools.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i4.initReflector();
}
