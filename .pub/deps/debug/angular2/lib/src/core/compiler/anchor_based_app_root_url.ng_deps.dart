library angular2.src.core.compiler.anchor_based_app_root_url.ng_deps.dart;

import 'anchor_based_app_root_url.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/compiler/app_root_url.dart' show AppRootUrl;
import 'package:angular2/src/core/compiler/app_root_url.ng_deps.dart' as i0;
import 'package:angular2/src/core/dom/dom_adapter.dart' show DOM;
import 'package:angular2/src/core/dom/dom_adapter.ng_deps.dart' as i1;
import 'package:angular2/src/core/di.dart' show Injectable;
import 'package:angular2/src/core/di.ng_deps.dart' as i2;
export 'anchor_based_app_root_url.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(AnchorBasedAppRootUrl, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [],
() => new AnchorBasedAppRootUrl())
)
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
}
