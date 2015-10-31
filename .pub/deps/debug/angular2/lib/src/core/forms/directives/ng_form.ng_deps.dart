library angular2.src.core.forms.directives.ng_form.ng_deps.dart;

import 'ng_form.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/facade/async.dart' show PromiseWrapper, ObservableWrapper, EventEmitter, PromiseCompleter;
import 'package:angular2/src/core/facade/async.ng_deps.dart' as i0;
import 'package:angular2/src/core/facade/collection.dart' show StringMapWrapper, ListWrapper;
import 'package:angular2/src/core/facade/lang.dart' show isPresent, isBlank;
import 'package:angular2/src/core/metadata.dart' show Directive;
import 'package:angular2/src/core/metadata.ng_deps.dart' as i3;
import 'package:angular2/src/core/di.dart' show Provider, Optional, Inject;
import 'package:angular2/src/core/di.ng_deps.dart' as i4;
import 'ng_control.dart' show NgControl;
import 'ng_control.ng_deps.dart' as i5;
import 'form_interface.dart' show Form;
import 'form_interface.ng_deps.dart' as i6;
import 'ng_control_group.dart' show NgControlGroup;
import 'ng_control_group.ng_deps.dart' as i7;
import 'control_container.dart' show ControlContainer;
import 'control_container.ng_deps.dart' as i8;
import '../model.dart' show AbstractControl, ControlGroup, Control;
import '../model.ng_deps.dart' as i9;
import 'shared.dart' show setUpControl, setUpControlGroup;
import 'shared.ng_deps.dart' as i10;
import '../validators.dart' show Validators, NG_VALIDATORS;
import '../validators.ng_deps.dart' as i11;
export 'ng_form.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(NgForm, new _ngRef.ReflectionInfo(
const [const Directive(bindings: const [formDirectiveProvider], exportAs: "form", host: const {"(submit)" : "onSubmit()"}, outputs: const ["ngSubmit"], selector: "form:not([ng-no-form]):not([ng-form-model]),ng-form,[ng-form]")],
const [const [List, const Optional(), const Inject(NG_VALIDATORS)]],
(List<Function> validators) => new NgForm(validators),
const [Form])
)
..registerGetters({'ngSubmit': (o) => o.ngSubmit})
;
i0.initReflector();
i3.initReflector();
i4.initReflector();
i5.initReflector();
i6.initReflector();
i7.initReflector();
i8.initReflector();
i9.initReflector();
i10.initReflector();
i11.initReflector();
}
