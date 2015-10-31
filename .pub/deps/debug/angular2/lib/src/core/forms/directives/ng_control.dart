library angular2.src.core.forms.directives.ng_control;

import "control_value_accessor.dart" show ControlValueAccessor;
import "abstract_control_directive.dart" show AbstractControlDirective;
import "package:angular2/src/core/facade/exceptions.dart" show unimplemented;
/**
 * A base class that all control directive extend.
 * It binds a [Control] object to a DOM element.
 */

// Cannot currently be abstract because it would contain

// an abstract method in the public API, and we cannot reflect

// on that in Dart due to https://github.com/dart-lang/sdk/issues/18721

// Also we don't have abstract setters, see https://github.com/Microsoft/TypeScript/issues/4669
abstract class NgControl extends AbstractControlDirective {
  String name = null;
  ControlValueAccessor valueAccessor = null;
  Function get validator {
    return unimplemented();
  }

  void viewToModelUpdate(dynamic newValue);
}
