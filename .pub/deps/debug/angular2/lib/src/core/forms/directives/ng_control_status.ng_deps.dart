library angular2.src.core.forms.directives.ng_control_status.ng_deps.dart;

import 'ng_control_status.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/metadata.dart' show Directive;
import 'package:angular2/src/core/metadata.ng_deps.dart' as i0;
import 'package:angular2/src/core/di.dart' show Self;
import 'package:angular2/src/core/di.ng_deps.dart' as i1;
import 'ng_control.dart' show NgControl;
import 'ng_control.ng_deps.dart' as i2;
import 'package:angular2/src/core/facade/lang.dart' show isBlank, isPresent;
export 'ng_control_status.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(NgControlStatus, new _ngRef.ReflectionInfo(
const [const Directive(host: const {"[class.ng-untouched]" : "ngClassUntouched", "[class.ng-touched]" : "ngClassTouched", "[class.ng-pristine]" : "ngClassPristine", "[class.ng-dirty]" : "ngClassDirty", "[class.ng-valid]" : "ngClassValid", "[class.ng-invalid]" : "ngClassInvalid"}, selector: "[ng-control],[ng-model],[ng-form-control]")],
const [const [NgControl, const Self()]],
(NgControl cd) => new NgControlStatus(cd))
)
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
}
