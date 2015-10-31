library angular2.src.mock.location_mock.ng_deps.dart;

import 'location_mock.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/facade/async.dart' show EventEmitter, ObservableWrapper;
import 'package:angular2/src/core/facade/async.ng_deps.dart' as i0;
import 'package:angular2/src/core/facade/collection.dart' show ListWrapper;
import 'package:angular2/src/router/location.dart' show Location;
import 'package:angular2/src/router/location.ng_deps.dart' as i2;
export 'location_mock.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i2.initReflector();
}
