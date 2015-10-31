library angular2.src.core.forms.directives.checkbox_value_accessor.ng_deps.dart;

import 'checkbox_value_accessor.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/metadata.dart' show Directive;
import 'package:angular2/src/core/metadata.ng_deps.dart' as i0;
import 'package:angular2/src/core/render.dart' show Renderer;
import 'package:angular2/src/core/render.ng_deps.dart' as i1;
import 'package:angular2/src/core/linker.dart' show ElementRef;
import 'package:angular2/src/core/linker.ng_deps.dart' as i2;
import 'package:angular2/src/core/di.dart' show Self, Provider;
import 'package:angular2/src/core/di.ng_deps.dart' as i3;
import 'control_value_accessor.dart' show NG_VALUE_ACCESSOR, ControlValueAccessor;
import 'control_value_accessor.ng_deps.dart' as i4;
import 'shared.dart' show setProperty;
import 'shared.ng_deps.dart' as i5;
export 'checkbox_value_accessor.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(CheckboxControlValueAccessor, new _ngRef.ReflectionInfo(
const [const Directive(bindings: const [CHECKBOX_VALUE_ACCESSOR], host: const {"(change)" : "onChange(\$event.target.checked)", "(blur)" : "onTouched()"}, selector: "input[type=checkbox][ng-control],input[type=checkbox][ng-form-control],input[type=checkbox][ng-model]")],
const [const [Renderer], const [ElementRef]],
(Renderer _renderer, ElementRef _elementRef) => new CheckboxControlValueAccessor(_renderer, _elementRef),
const [ControlValueAccessor])
)
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
i5.initReflector();
}
