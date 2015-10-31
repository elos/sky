library angular2.src.core.render.render.ng_deps.dart;

import 'render.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'dom/shared_styles_host.ng_deps.dart' as i0;
import 'dom/dom_renderer.ng_deps.dart' as i1;
import 'dom/dom_tokens.ng_deps.dart' as i2;
import 'api.ng_deps.dart' as i3;
export 'render.dart';
export 'dom/shared_styles_host.dart';
export 'dom/dom_renderer.dart';
export 'dom/dom_tokens.dart';
export 'api.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
}
