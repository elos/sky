library angular2.src.core.linker.view_ref.ng_deps.dart;

import 'view_ref.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/facade/lang.dart' show isPresent;
import 'package:angular2/src/core/facade/exceptions.dart' show unimplemented;
import 'package:angular2/src/core/facade/exceptions.ng_deps.dart' as i1;
import 'view.dart' as viewModule;
import 'view.ng_deps.dart' as i2;
import '../change_detection/change_detector_ref.dart' show ChangeDetectorRef;
import '../change_detection/change_detector_ref.ng_deps.dart' as i3;
import 'package:angular2/src/core/render/api.dart' show RenderViewRef, RenderFragmentRef;
import 'package:angular2/src/core/render/api.ng_deps.dart' as i4;
export 'view_ref.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
}
