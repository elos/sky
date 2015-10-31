library angular2.src.core.render.view.ng_deps.dart;

import 'view.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/facade/exceptions.dart' show BaseException;
import 'package:angular2/src/core/facade/exceptions.ng_deps.dart' as i0;
import 'package:angular2/src/core/facade/collection.dart' show ListWrapper, MapWrapper, Map, StringMapWrapper;
import 'package:angular2/src/core/facade/lang.dart' show isPresent, isBlank, stringify;
import 'api.dart' show RenderViewRef, RenderEventDispatcher, RenderTemplateCmd, RenderProtoViewRef, RenderFragmentRef;
import 'api.ng_deps.dart' as i3;
export 'view.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i3.initReflector();
}
