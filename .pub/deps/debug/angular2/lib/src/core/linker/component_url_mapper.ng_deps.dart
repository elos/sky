library angular2.src.core.linker.component_url_mapper.ng_deps.dart;

import 'component_url_mapper.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/di.dart' show Injectable;
import 'package:angular2/src/core/di.ng_deps.dart' as i0;
import 'package:angular2/src/core/facade/lang.dart' show Type, isPresent;
import 'package:angular2/src/core/facade/collection.dart' show Map, MapWrapper;
import 'package:angular2/src/core/reflection/reflection.dart' show reflector;
import 'package:angular2/src/core/reflection/reflection.ng_deps.dart' as i3;
export 'component_url_mapper.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(ComponentUrlMapper, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [],
() => new ComponentUrlMapper())
)
;
i0.initReflector();
i3.initReflector();
}
