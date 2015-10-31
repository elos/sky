library angular2.src.core.forms.directives.control_value_accessor;

import "package:angular2/src/core/di.dart" show OpaqueToken;

/**
 * A bridge between a control and a native element.
 *
 * Please see [DefaultValueAccessor] for more information.
 */
abstract class ControlValueAccessor {
  void writeValue(dynamic obj);
  void registerOnChange(dynamic fn);
  void registerOnTouched(dynamic fn);
}

const OpaqueToken NG_VALUE_ACCESSOR = const OpaqueToken("NgValueAccessor");
