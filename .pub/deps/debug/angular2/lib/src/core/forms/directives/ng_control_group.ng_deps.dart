library angular2.src.core.forms.directives.ng_control_group.ng_deps.dart;

import 'ng_control_group.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/lifecycle_hooks.dart' show OnInit, OnDestroy;
import 'package:angular2/lifecycle_hooks.ng_deps.dart' as i0;
import 'package:angular2/src/core/metadata.dart' show Directive;
import 'package:angular2/src/core/metadata.ng_deps.dart' as i1;
import 'package:angular2/src/core/di.dart' show Optional, Inject, Host, SkipSelf, Provider;
import 'package:angular2/src/core/di.ng_deps.dart' as i2;
import 'package:angular2/src/core/facade/collection.dart' show ListWrapper;
import 'control_container.dart' show ControlContainer;
import 'control_container.ng_deps.dart' as i4;
import 'shared.dart' show controlPath;
import 'shared.ng_deps.dart' as i5;
import '../model.dart' show ControlGroup;
import '../model.ng_deps.dart' as i6;
import 'form_interface.dart' show Form;
import 'form_interface.ng_deps.dart' as i7;
import '../validators.dart' show Validators, NG_VALIDATORS;
import '../validators.ng_deps.dart' as i8;
export 'ng_control_group.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(NgControlGroup, new _ngRef.ReflectionInfo(
const [const Directive(bindings: const [controlGroupBinding], exportAs: "form", inputs: const ["name: ng-control-group"], selector: "[ng-control-group]")],
const [const [ControlContainer, const Host(), const SkipSelf()], const [List, const Optional(), const Inject(NG_VALIDATORS)]],
(ControlContainer parent, List<Function> validators) => new NgControlGroup(parent, validators),
const [OnInit, OnDestroy])
)
..registerSetters({'name': (o, v) => o.name = v})
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i4.initReflector();
i5.initReflector();
i6.initReflector();
i7.initReflector();
i8.initReflector();
}
