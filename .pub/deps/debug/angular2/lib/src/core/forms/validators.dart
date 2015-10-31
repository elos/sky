library angular2.src.core.forms.validators;

import "package:angular2/src/core/facade/lang.dart" show isBlank, isPresent;
import "package:angular2/src/core/facade/collection.dart"
    show ListWrapper, StringMapWrapper;
import "package:angular2/src/core/di.dart" show OpaqueToken;
import "model.dart" as modelModule;

const OpaqueToken NG_VALIDATORS = const OpaqueToken("NgValidators");

/**
 * Provides a set of validators used by form controls.
 *
 * ### Example
 *
 * ```
 * var loginControl = new Control("", Validators.required)
 * ```
 */
class Validators {
  static Map<String, bool> required(modelModule.Control control) {
    return isBlank(control.value) || control.value == ""
        ? {"required": true}
        : null;
  }

  static Function minLength(num minLength) {
    return /* Map < String , dynamic > */ (modelModule.Control control) {
      if (isPresent(Validators.required(control))) return null;
      String v = control.value;
      return v.length < minLength
          ? {
              "minlength": {
                "requiredLength": minLength,
                "actualLength": v.length
              }
            }
          : null;
    };
  }

  static Function maxLength(num maxLength) {
    return /* Map < String , dynamic > */ (modelModule.Control control) {
      if (isPresent(Validators.required(control))) return null;
      String v = control.value;
      return v.length > maxLength
          ? {
              "maxlength": {
                "requiredLength": maxLength,
                "actualLength": v.length
              }
            }
          : null;
    };
  }

  static Map<String, bool> nullValidator(dynamic c) {
    return null;
  }

  static Function compose(List<Function> validators) {
    if (isBlank(validators)) return Validators.nullValidator;
    return (modelModule.AbstractControl control) {
      var res = ListWrapper.reduce(validators, (res, validator) {
        var errors = validator(control);
        return isPresent(errors)
            ? StringMapWrapper.merge((res as dynamic), (errors as dynamic))
            : res;
      }, {});
      return StringMapWrapper.isEmpty(res) ? null : res;
    };
  }
}
