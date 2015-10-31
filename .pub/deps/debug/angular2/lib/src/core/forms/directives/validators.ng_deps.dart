library angular2.src.core.forms.directives.validators.ng_deps.dart;

import 'validators.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/di.dart' show Provider, OpaqueToken;
import 'package:angular2/src/core/di.ng_deps.dart' as i0;
import 'package:angular2/src/core/metadata.dart' show Attribute, Directive;
import 'package:angular2/src/core/metadata.ng_deps.dart' as i1;
import '../validators.dart' show Validators, NG_VALIDATORS;
import '../validators.ng_deps.dart' as i2;
import '../model.dart' show Control;
import '../model.dart' as modelModule;
import '../model.ng_deps.dart' as i4;
import 'package:angular2/src/core/facade/lang.dart' show NumberWrapper;
export 'validators.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(RequiredValidator, new _ngRef.ReflectionInfo(
const [const Directive(providers: const [REQUIRED_VALIDATOR], selector: "[required][ng-control],[required][ng-form-control],[required][ng-model]")],
const [],
() => new RequiredValidator())
)
..registerType(MinLengthValidator, new _ngRef.ReflectionInfo(
const [const Directive(providers: const [MIN_LENGTH_VALIDATOR], selector: "[minlength][ng-control],[minlength][ng-form-control],[minlength][ng-model]")],
const [const [String, const Attribute("minlength")]],
(String minLength) => new MinLengthValidator(minLength),
const [Validator])
)
..registerType(MaxLengthValidator, new _ngRef.ReflectionInfo(
const [const Directive(providers: const [MAX_LENGTH_VALIDATOR], selector: "[maxlength][ng-control],[maxlength][ng-form-control],[maxlength][ng-model]")],
const [const [String, const Attribute("maxlength")]],
(String minLength) => new MaxLengthValidator(minLength),
const [Validator])
)
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i4.initReflector();
}
