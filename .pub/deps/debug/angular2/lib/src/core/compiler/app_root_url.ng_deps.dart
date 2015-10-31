library angular2.src.core.compiler.app_root_url.ng_deps.dart;

import 'app_root_url.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/di.dart' show Injectable;
import 'package:angular2/src/core/di.ng_deps.dart' as i0;
import 'package:angular2/src/core/facade/lang.dart' show isBlank;
export 'app_root_url.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(AppRootUrl, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [const [String]],
(String value) => new AppRootUrl(value))
)
;
i0.initReflector();
}
