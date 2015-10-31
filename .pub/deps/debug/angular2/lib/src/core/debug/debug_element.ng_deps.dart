library angular2.src.core.debug.debug_element.ng_deps.dart;

import 'debug_element.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/facade/lang.dart' show Type, isPresent, isBlank;
import 'package:angular2/src/core/facade/collection.dart' show ListWrapper, MapWrapper, Predicate;
import 'package:angular2/src/core/facade/exceptions.dart' show unimplemented;
import 'package:angular2/src/core/facade/exceptions.ng_deps.dart' as i2;
import 'package:angular2/src/core/dom/dom_adapter.dart' show DOM;
import 'package:angular2/src/core/dom/dom_adapter.ng_deps.dart' as i3;
import 'package:angular2/src/core/linker/element_injector.dart' show ElementInjector;
import 'package:angular2/src/core/linker/element_injector.ng_deps.dart' as i4;
import 'package:angular2/src/core/linker/view.dart' show AppView, ViewType;
import 'package:angular2/src/core/linker/view.ng_deps.dart' as i5;
import 'package:angular2/src/core/linker/view_ref.dart' show internalView;
import 'package:angular2/src/core/linker/view_ref.ng_deps.dart' as i6;
import 'package:angular2/src/core/linker/element_ref.dart' show ElementRef, ElementRef_;
import 'package:angular2/src/core/linker/element_ref.ng_deps.dart' as i7;
export 'debug_element.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i2.initReflector();
i3.initReflector();
i4.initReflector();
i5.initReflector();
i6.initReflector();
i7.initReflector();
}
