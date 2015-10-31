library angular2.src.core.forms.directives.control_container;

import "form_interface.dart" show Form;
import "abstract_control_directive.dart" show AbstractControlDirective;

/**
 * A directive that contains multiple [NgControl].
 *
 * Only used by the forms module.
 */
class ControlContainer extends AbstractControlDirective {
  String name;
  Form get formDirective {
    return null;
  }

  List<String> get path {
    return null;
  }
}
