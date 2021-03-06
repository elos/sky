library angular2.src.router.path_location_strategy.ng_deps.dart;

import 'path_location_strategy.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/dom/dom_adapter.dart' show DOM;
import 'package:angular2/src/core/dom/dom_adapter.ng_deps.dart' as i0;
import 'package:angular2/angular2.dart' show Injectable;
import 'package:angular2/angular2.ng_deps.dart' as i1;
import 'package:angular2/src/core/facade/browser.dart' show EventListener, History, Location;
import 'location_strategy.dart' show LocationStrategy, normalizeQueryParams;
export 'path_location_strategy.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(PathLocationStrategy, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [],
() => new PathLocationStrategy())
)
;
i0.initReflector();
i1.initReflector();
}
