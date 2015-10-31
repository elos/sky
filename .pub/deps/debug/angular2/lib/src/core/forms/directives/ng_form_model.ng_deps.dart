library angular2.src.core.forms.directives.ng_form_model.ng_deps.dart;

import 'ng_form_model.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/facade/collection.dart' show ListWrapper, StringMapWrapper;
import 'package:angular2/src/core/facade/async.dart' show ObservableWrapper, EventEmitter;
import 'package:angular2/src/core/facade/async.ng_deps.dart' as i1;
import 'package:angular2/src/core/change_detection.dart' show SimpleChange;
import 'package:angular2/src/core/change_detection.ng_deps.dart' as i2;
import 'package:angular2/lifecycle_hooks.dart' show OnChanges;
import 'package:angular2/lifecycle_hooks.ng_deps.dart' as i3;
import 'package:angular2/src/core/metadata.dart' show Directive;
import 'package:angular2/src/core/metadata.ng_deps.dart' as i4;
import 'package:angular2/src/core/di.dart' show Provider, Inject, Optional;
import 'package:angular2/src/core/di.ng_deps.dart' as i5;
import 'ng_control.dart' show NgControl;
import 'ng_control.ng_deps.dart' as i6;
import 'ng_control_group.dart' show NgControlGroup;
import 'ng_control_group.ng_deps.dart' as i7;
import 'control_container.dart' show ControlContainer;
import 'control_container.ng_deps.dart' as i8;
import 'form_interface.dart' show Form;
import 'form_interface.ng_deps.dart' as i9;
import '../model.dart' show Control, ControlGroup;
import '../model.ng_deps.dart' as i10;
import 'shared.dart' show setUpControl, setUpControlGroup;
import 'shared.ng_deps.dart' as i11;
import '../validators.dart' show Validators, NG_VALIDATORS;
import '../validators.ng_deps.dart' as i12;
export 'ng_form_model.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(NgFormModel, new _ngRef.ReflectionInfo(
const [const Directive(bindings: const [formDirectiveProvider], exportAs: "form", host: const {"(submit)" : "onSubmit()"}, inputs: const ["form: ng-form-model"], outputs: const ["ngSubmit"], selector: "[ng-form-model]")],
const [const [List, const Optional(), const Inject(NG_VALIDATORS)]],
(List<Function> validators) => new NgFormModel(validators),
const [Form, OnChanges])
)
..registerGetters({'ngSubmit': (o) => o.ngSubmit})
..registerSetters({'form': (o, v) => o.form = v})
;
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
i11.initReflector();
i12.initReflector();
}
