library angular2.src.core.life_cycle.life_cycle.ng_deps.dart;

import 'life_cycle.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/di.dart' show Injectable;
import 'package:angular2/src/core/di.ng_deps.dart' as i0;
import 'package:angular2/src/core/change_detection/change_detection.dart' show ChangeDetector;
import 'package:angular2/src/core/change_detection/change_detection.ng_deps.dart' as i1;
import 'package:angular2/src/core/zone/ng_zone.dart' show NgZone;
import 'package:angular2/src/core/zone/ng_zone.ng_deps.dart' as i2;
import 'package:angular2/src/core/facade/lang.dart' show isPresent;
import 'package:angular2/src/core/facade/exceptions.dart' show BaseException, WrappedException;
import 'package:angular2/src/core/facade/exceptions.ng_deps.dart' as i4;
import '../profile/profile.dart' show wtfLeave, wtfCreateScope, WtfScopeFn;
import '../profile/profile.ng_deps.dart' as i5;
export 'life_cycle.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(LifeCycle_, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [const [ChangeDetector], const [bool]],
(ChangeDetector changeDetector, bool enforceNoNewChanges) => new LifeCycle_(changeDetector, enforceNoNewChanges))
)
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i4.initReflector();
i5.initReflector();
}
