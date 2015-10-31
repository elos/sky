library angular2.src.core.linker.view_manager_utils.ng_deps.dart;

import 'view_manager_utils.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/di.dart' show Injector, Provider, Injectable, ResolvedProvider;
import 'package:angular2/src/core/di.ng_deps.dart' as i0;
import 'package:angular2/src/core/facade/collection.dart' show ListWrapper, MapWrapper, Map, StringMapWrapper;
import 'element_injector.dart' as eli;
import 'element_injector.ng_deps.dart' as i2;
import 'package:angular2/src/core/facade/lang.dart' show isPresent, isBlank;
import 'view.dart' as viewModule;
import 'view.ng_deps.dart' as i4;
import 'view_manager.dart' as avmModule;
import 'view_manager.ng_deps.dart' as i5;
import 'element_ref.dart' show ElementRef, ElementRef_;
import 'element_ref.ng_deps.dart' as i6;
import 'template_ref.dart' show TemplateRef, TemplateRef_;
import 'template_ref.ng_deps.dart' as i7;
import 'package:angular2/src/core/render/api.dart' show Renderer, RenderViewWithFragments;
import 'package:angular2/src/core/render/api.ng_deps.dart' as i8;
import 'package:angular2/src/core/change_detection/change_detection.dart' show Locals;
import 'package:angular2/src/core/change_detection/change_detection.ng_deps.dart' as i9;
import 'package:angular2/src/core/pipes/pipes.dart' show Pipes;
import 'package:angular2/src/core/pipes/pipes.ng_deps.dart' as i10;
export 'view_manager_utils.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(AppViewManagerUtils, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [],
() => new AppViewManagerUtils())
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
}
