library angular2.src.testing.test_component_builder.ng_deps.dart;

import 'test_component_builder.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/di.dart' show Injector, provide, Injectable;
import 'package:angular2/src/core/di.ng_deps.dart' as i0;
import 'package:angular2/src/core/facade/lang.dart' show Type, isPresent, isBlank;
import 'package:angular2/src/core/facade/async.dart' show Future;
import 'package:angular2/src/core/facade/async.ng_deps.dart' as i2;
import 'package:angular2/src/core/facade/collection.dart' show ListWrapper, MapWrapper;
import '../core/metadata.dart' show ViewMetadata;
import '../core/metadata.ng_deps.dart' as i4;
import 'package:angular2/src/core/linker/directive_resolver.dart' show DirectiveResolver;
import 'package:angular2/src/core/linker/directive_resolver.ng_deps.dart' as i5;
import 'package:angular2/src/core/linker/view_resolver.dart' show ViewResolver;
import 'package:angular2/src/core/linker/view_resolver.ng_deps.dart' as i6;
import 'package:angular2/src/core/linker/view.dart' show AppView;
import 'package:angular2/src/core/linker/view.ng_deps.dart' as i7;
import 'package:angular2/src/core/linker/view_ref.dart' show internalView, ViewRef;
import 'package:angular2/src/core/linker/view_ref.ng_deps.dart' as i8;
import 'package:angular2/src/core/linker/dynamic_component_loader.dart' show DynamicComponentLoader, ComponentRef;
import 'package:angular2/src/core/linker/dynamic_component_loader.ng_deps.dart' as i9;
import 'utils.dart' show el;
import 'utils.ng_deps.dart' as i10;
import 'package:angular2/src/core/render/render.dart' show DOCUMENT;
import 'package:angular2/src/core/render/render.ng_deps.dart' as i11;
import 'package:angular2/src/core/dom/dom_adapter.dart' show DOM;
import 'package:angular2/src/core/dom/dom_adapter.ng_deps.dart' as i12;
import 'package:angular2/src/core/debug/debug_element.dart' show DebugElement, DebugElement_;
import 'package:angular2/src/core/debug/debug_element.ng_deps.dart' as i13;
export 'test_component_builder.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(TestComponentBuilder, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [const [Injector]],
(Injector _injector) => new TestComponentBuilder(_injector))
)
;
i0.initReflector();
i2.initReflector();
i4.initReflector();
i5.initReflector();
i6.initReflector();
i7.initReflector();
i8.initReflector();
i9.initReflector();
i10.initReflector();
i11.initReflector();
i12.initReflector();
i13.initReflector();
}
