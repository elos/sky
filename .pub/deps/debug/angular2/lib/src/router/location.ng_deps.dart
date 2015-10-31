library angular2.src.router.location.ng_deps.dart;

import 'location.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'location_strategy.dart' show LocationStrategy;
import 'package:angular2/src/core/facade/lang.dart' show StringWrapper, isPresent;
import 'package:angular2/src/core/facade/async.dart' show EventEmitter, ObservableWrapper;
import 'package:angular2/src/core/facade/async.ng_deps.dart' as i2;
import 'package:angular2/src/core/facade/lang.dart' show isBlank;
import 'package:angular2/src/core/facade/exceptions.dart' show BaseException, WrappedException;
import 'package:angular2/src/core/facade/exceptions.ng_deps.dart' as i4;
import 'package:angular2/angular2.dart' show OpaqueToken, Injectable, Optional, Inject;
import 'package:angular2/angular2.ng_deps.dart' as i5;
export 'location.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(Location, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [const [LocationStrategy], const [String, const Optional(), const Inject(APP_BASE_HREF)]],
(LocationStrategy platformStrategy, String href) => new Location(platformStrategy, href))
)
;
i2.initReflector();
i4.initReflector();
i5.initReflector();
}
