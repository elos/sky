library angular2.src.core.render.view_factory.ng_deps.dart;

import 'view_factory.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/facade/lang.dart' show isBlank, isPresent;
import 'api.dart' show RenderEventDispatcher, RenderTemplateCmd, RenderCommandVisitor, RenderBeginElementCmd, RenderBeginComponentCmd, RenderNgContentCmd, RenderTextCmd, RenderEmbeddedTemplateCmd;
import 'api.ng_deps.dart' as i1;
import 'view.dart' show DefaultRenderView, DefaultRenderFragmentRef;
import 'view.ng_deps.dart' as i2;
export 'view_factory.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i1.initReflector();
i2.initReflector();
}
