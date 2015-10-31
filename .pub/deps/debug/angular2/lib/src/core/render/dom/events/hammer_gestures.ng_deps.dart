library angular.events.ng_deps.dart;

import 'hammer_gestures.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'dart:html';
import './hammer_common.dart';
import './hammer_common.ng_deps.dart' as i1;
import 'package:angular2/src/core/facade/exceptions.dart' show BaseException;
import 'package:angular2/src/core/facade/exceptions.ng_deps.dart' as i2;
import 'package:angular2/src/core/di.dart' show Injectable;
import 'package:angular2/src/core/di.ng_deps.dart' as i3;
import 'dart:js' as js;
export 'hammer_gestures.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(HammerGesturesPlugin, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [],
() => new HammerGesturesPlugin())
)
;
i1.initReflector();
i2.initReflector();
i3.initReflector();
}
