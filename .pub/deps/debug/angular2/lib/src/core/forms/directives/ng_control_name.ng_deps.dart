library angular2.src.core.forms.directives.ng_control_name.ng_deps.dart;

import 'ng_control_name.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/facade/async.dart' show EventEmitter, ObservableWrapper;
import 'package:angular2/src/core/facade/async.ng_deps.dart' as i0;
import 'package:angular2/lifecycle_hooks.dart' show OnChanges, OnDestroy;
import 'package:angular2/lifecycle_hooks.ng_deps.dart' as i1;
import 'package:angular2/src/core/change_detection.dart' show SimpleChange;
import 'package:angular2/src/core/change_detection.ng_deps.dart' as i2;
import 'package:angular2/src/core/metadata.dart' show Query, Directive;
import 'package:angular2/src/core/metadata.ng_deps.dart' as i3;
import 'package:angular2/src/core/di.dart' show Host, SkipSelf, Provider, Inject, Optional;
import 'package:angular2/src/core/di.ng_deps.dart' as i4;
import 'control_container.dart' show ControlContainer;
import 'control_container.ng_deps.dart' as i5;
import 'ng_control.dart' show NgControl;
import 'ng_control.ng_deps.dart' as i6;
import 'control_value_accessor.dart' show ControlValueAccessor, NG_VALUE_ACCESSOR;
import 'control_value_accessor.ng_deps.dart' as i7;
import 'shared.dart' show controlPath, composeValidators, isPropertyUpdated, selectValueAccessor;
import 'shared.ng_deps.dart' as i8;
import '../model.dart' show Control;
import '../model.ng_deps.dart' as i9;
import '../validators.dart' show Validators, NG_VALIDATORS;
import '../validators.ng_deps.dart' as i10;
export 'ng_control_name.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(NgControlName, new _ngRef.ReflectionInfo(
const [const Directive(bindings: const [controlNameBinding], exportAs: "form", inputs: const ["name: ngControl", "model: ngModel"], outputs: const ["update: ngModelChange"], selector: "[ng-control]")],
const [const [ControlContainer, const Host(), const SkipSelf()], const [List, const Optional(), const Inject(NG_VALIDATORS)], const [List, const Optional(), const Inject(NG_VALUE_ACCESSOR)]],
(ControlContainer parent, List<dynamic> validators, List<ControlValueAccessor> valueAccessors) => new NgControlName(parent, validators, valueAccessors),
const [OnChanges, OnDestroy])
)
..registerGetters({'update': (o) => o.update})
..registerSetters({'name': (o, v) => o.name = v, 'model': (o, v) => o.model = v})
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
i10.initReflector();
}
