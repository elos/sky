library angular2.src.core.forms.directives.ng_model.ng_deps.dart;

import 'ng_model.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/facade/async.dart' show EventEmitter, ObservableWrapper;
import 'package:angular2/src/core/facade/async.ng_deps.dart' as i0;
import 'package:angular2/lifecycle_hooks.dart' show OnChanges;
import 'package:angular2/lifecycle_hooks.ng_deps.dart' as i1;
import 'package:angular2/src/core/change_detection.dart' show SimpleChange;
import 'package:angular2/src/core/change_detection.ng_deps.dart' as i2;
import 'package:angular2/src/core/metadata.dart' show Query, Directive;
import 'package:angular2/src/core/metadata.ng_deps.dart' as i3;
import 'package:angular2/src/core/di.dart' show Provider, Inject, Optional;
import 'package:angular2/src/core/di.ng_deps.dart' as i4;
import 'control_value_accessor.dart' show ControlValueAccessor, NG_VALUE_ACCESSOR;
import 'control_value_accessor.ng_deps.dart' as i5;
import 'ng_control.dart' show NgControl;
import 'ng_control.ng_deps.dart' as i6;
import '../model.dart' show Control;
import '../model.ng_deps.dart' as i7;
import '../validators.dart' show Validators, NG_VALIDATORS;
import '../validators.ng_deps.dart' as i8;
import 'shared.dart' show setUpControl, isPropertyUpdated, selectValueAccessor, composeValidators;
import 'shared.ng_deps.dart' as i9;
export 'ng_model.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(NgModel, new _ngRef.ReflectionInfo(
const [const Directive(bindings: const [formControlBinding], exportAs: "form", inputs: const ["model: ngModel"], outputs: const ["update: ngModelChange"], selector: "[ng-model]:not([ng-control]):not([ng-form-control])")],
const [const [List, const Optional(), const Inject(NG_VALIDATORS)], const [List, const Optional(), const Inject(NG_VALUE_ACCESSOR)]],
(List<dynamic> validators, List<ControlValueAccessor> valueAccessors) => new NgModel(validators, valueAccessors),
const [OnChanges])
)
..registerGetters({'update': (o) => o.update})
..registerSetters({'model': (o, v) => o.model = v})
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
i5.initReflector();
i6.initReflector();
i7.initReflector();
i8.initReflector();
i9.initReflector();
}
