library angular2.src.core.linker.template_commands.ng_deps.dart;

import 'template_commands.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/facade/lang.dart' show Type, isPresent, isBlank;
import 'package:angular2/src/core/render/render.dart' show RenderTemplateCmd, RenderCommandVisitor, RenderBeginElementCmd, RenderTextCmd, RenderNgContentCmd, RenderBeginComponentCmd, RenderEmbeddedTemplateCmd;
import 'package:angular2/src/core/render/render.ng_deps.dart' as i1;
export 'template_commands.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i1.initReflector();
}
