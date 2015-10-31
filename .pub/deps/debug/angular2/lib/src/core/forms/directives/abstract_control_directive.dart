library angular2.src.core.forms.directives.abstract_control_directive;

import "../model.dart" show AbstractControl;
import "package:angular2/src/core/facade/lang.dart" show isPresent;
import "package:angular2/src/core/facade/exceptions.dart" show unimplemented;

abstract class AbstractControlDirective {
  AbstractControl get control {
    return unimplemented();
  }

  dynamic get value {
    return isPresent(this.control) ? this.control.value : null;
  }

  bool get valid {
    return isPresent(this.control) ? this.control.valid : null;
  }

  Map<String, dynamic> get errors {
    return isPresent(this.control) ? this.control.errors : null;
  }

  dynamic get controlsErrors {
    return isPresent(this.control) ? this.control.controlsErrors : null;
  }

  bool get pristine {
    return isPresent(this.control) ? this.control.pristine : null;
  }

  bool get dirty {
    return isPresent(this.control) ? this.control.dirty : null;
  }

  bool get touched {
    return isPresent(this.control) ? this.control.touched : null;
  }

  bool get untouched {
    return isPresent(this.control) ? this.control.untouched : null;
  }

  List<String> get path {
    return null;
  }
}
