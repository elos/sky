library angular2.src.services.url_resolver.ng_deps.dart;

import 'url_resolver.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/di.dart' show Injectable, Provider;
import 'package:angular2/src/core/di.ng_deps.dart' as i0;
export 'url_resolver.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(UrlResolver, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [],
() => new UrlResolver())
)
;
i0.initReflector();
}
