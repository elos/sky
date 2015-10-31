library angular2.src.core.forms.model;

import "package:angular2/src/core/facade/lang.dart"
    show StringWrapper, isPresent, isBlank, normalizeBool;
import "package:angular2/src/core/facade/async.dart"
    show Stream, EventEmitter, ObservableWrapper;
import "package:angular2/src/core/facade/collection.dart"
    show StringMapWrapper, ListWrapper;
import "validators.dart" show Validators;

/**
 * Indicates that a Control is valid, i.e. that no errors exist in the input value.
 */
const VALID = "VALID";
/**
 * Indicates that a Control is invalid, i.e. that an error exists in the input value.
 */
const INVALID = "INVALID";
/**
 * Indicates that a Control is pending, i.e. that async validation is occuring and
 * errors are not yet available for the input value.
 */
const PENDING = "PENDING";
bool isControl(Object control) {
  return control is AbstractControl;
}

_find(AbstractControl control,
    dynamic /* List < dynamic /* String | num */ > | String */ path) {
  if (isBlank(path)) return null;
  if (!(path is List)) {
    path = ((path as String)).split("/");
  }
  if (path is List && ListWrapper.isEmpty(path)) return null;
  return ListWrapper.reduce((path as List<dynamic /* String | num */ >),
      (v, name) {
    if (v is ControlGroup) {
      return isPresent(v.controls[name]) ? v.controls[name] : null;
    } else if (v is ControlArray) {
      var index = (name as num);
      return isPresent(v.at(index)) ? v.at(index) : null;
    } else {
      return null;
    }
  }, control);
}

/**
 *
 */
abstract class AbstractControl {
  Function validator;
  /** @internal */
  dynamic _value;
  /** @internal */
  EventEmitter _valueChanges;
  String _status;
  Map<String, dynamic> _errors;
  dynamic _controlsErrors;
  bool _pristine = true;
  bool _touched = false;
  dynamic /* ControlGroup | ControlArray */ _parent;
  AbstractControl(this.validator) {}
  dynamic get value {
    return this._value;
  }

  String get status {
    return this._status;
  }

  bool get valid {
    return identical(this._status, VALID);
  }

  /**
   * Returns the errors of this control.
   */
  Map<String, dynamic> get errors {
    return this._errors;
  }

  /**
   * Returns the errors of the child controls.
   */
  dynamic get controlsErrors {
    return this._controlsErrors;
  }

  bool get pristine {
    return this._pristine;
  }

  bool get dirty {
    return !this.pristine;
  }

  bool get touched {
    return this._touched;
  }

  bool get untouched {
    return !this._touched;
  }

  Stream get valueChanges {
    return this._valueChanges;
  }

  bool get pending {
    return this._status == PENDING;
  }

  void markAsTouched() {
    this._touched = true;
  }

  void markAsDirty({onlySelf}) {
    onlySelf = normalizeBool(onlySelf);
    this._pristine = false;
    if (isPresent(this._parent) && !onlySelf) {
      this._parent.markAsDirty(onlySelf: onlySelf);
    }
  }

  void markAsPending({onlySelf}) {
    onlySelf = normalizeBool(onlySelf);
    this._status = PENDING;
    if (isPresent(this._parent) && !onlySelf) {
      this._parent.markAsPending(onlySelf: onlySelf);
    }
  }

  void setParent(dynamic /* ControlGroup | ControlArray */ parent) {
    this._parent = parent;
  }

  void updateValueAndValidity({onlySelf, emitEvent}) {
    onlySelf = normalizeBool(onlySelf);
    emitEvent = isPresent(emitEvent) ? emitEvent : true;
    this._updateValue();
    this._errors = this.validator(this);
    this._controlsErrors = this._calculateControlsErrors();
    this._status = this._calculateStatus();
    if (emitEvent) {
      ObservableWrapper.callNext(this._valueChanges, this._value);
    }
    if (isPresent(this._parent) && !onlySelf) {
      this
          ._parent
          .updateValueAndValidity(onlySelf: onlySelf, emitEvent: emitEvent);
    }
  }

  /**
   * Sets errors on a control.
   *
   * This is used when validations are run not automatically, but manually by the user.
   *
   * Calling `setErrors` will also update the validity of the parent control.
   *
   * ## Usage
   *
   * ```
   * var login = new Control("someLogin");
   * login.setErrors({
   *   "notUnique": true
   * });
   *
   * expect(login.valid).toEqual(false);
   * expect(login.errors).toEqual({"notUnique": true});
   *
   * login.updateValue("someOtherLogin");
   *
   * expect(login.valid).toEqual(true);
   * ```
   */
  void setErrors(Map<String, dynamic> errors) {
    this._errors = errors;
    this._status = this._calculateStatus();
    if (isPresent(this._parent)) {
      this._parent._updateControlsErrors();
    }
  }

  AbstractControl find(
      dynamic /* List < dynamic /* String | num */ > | String */ path) {
    return _find(this, path);
  }

  dynamic getError(String errorCode, [List<String> path = null]) {
    var control =
        isPresent(path) && !ListWrapper.isEmpty(path) ? this.find(path) : this;
    if (isPresent(control) && isPresent(control._errors)) {
      return StringMapWrapper.get(control._errors, errorCode);
    } else {
      return null;
    }
  }

  bool hasError(String errorCode, [List<String> path = null]) {
    return isPresent(this.getError(errorCode, path));
  }

  /** @internal */
  void _updateControlsErrors() {
    this._controlsErrors = this._calculateControlsErrors();
    this._status = this._calculateStatus();
    if (isPresent(this._parent)) {
      this._parent._updateControlsErrors();
    }
  }

  String _calculateStatus() {
    return isPresent(this._errors) || isPresent(this._controlsErrors)
        ? INVALID
        : VALID;
  }

  /** @internal */
  void _updateValue();
  /** @internal */
  dynamic _calculateControlsErrors();
}

/**
 * Defines a part of a form that cannot be divided into other controls. `Control`s have values and
 * validation state, which is determined by an optional validation function.
 *
 * `Control` is one of the three fundamental building blocks used to define forms in Angular, along
 * with [ControlGroup] and [ControlArray].
 *
 *##Usage
 *
 * By default, a `Control` is created for every `<input>` or other form component.
 * With [NgFormControl] or [NgFormModel] an existing [Control] can be
 * bound to a DOM element instead. This `Control` can be configured with a custom
 * validation function.
 *
 * ### Example ([live demo](http://plnkr.co/edit/23DESOpbNnBpBHZt1BR4?p=preview))
 */
class Control extends AbstractControl {
  /** @internal */
  Function _onChange;
  Control([dynamic value = null, Function validator = Validators.nullValidator])
      : super(validator) {
    /* super call moved to initializer */;
    this._value = value;
    this.updateValueAndValidity(onlySelf: true, emitEvent: false);
    this._valueChanges = new EventEmitter();
  }
  /**
   * Set the value of the control to `value`.
   *
   * If `onlySelf` is `true`, this change will only affect the validation of this `Control`
   * and not its parent component. If `emitEvent` is `true`, this change will cause a
   * `valueChanges` event on the `Control` to be emitted. Both of these options default to
   * `false`.
   *
   * If `emitModelToViewChange` is `true`, the view will be notified about the new value
   * via an `onChange` event. This is the default behavior if `emitModelToViewChange` is not
   * specified.
   */
  void updateValue(dynamic value,
      {onlySelf, emitEvent, emitModelToViewChange}) {
    emitModelToViewChange =
        isPresent(emitModelToViewChange) ? emitModelToViewChange : true;
    this._value = value;
    if (isPresent(this._onChange) && emitModelToViewChange) this
        ._onChange(this._value);
    this.updateValueAndValidity(onlySelf: onlySelf, emitEvent: emitEvent);
  }

  /**
   * @internal
   */
  _updateValue() {}
  /**
   * @internal
   */
  _calculateControlsErrors() {
    return null;
  }

  /**
   * Register a listener for change events.
   */
  void registerOnChange(Function fn) {
    this._onChange = fn;
  }
}

/**
 * Defines a part of a form, of fixed length, that can contain other controls.
 *
 * A `ControlGroup` aggregates the values and errors of each [Control] in the group. Thus, if
 * one of the controls in a group is invalid, the entire group is invalid. Similarly, if a control
 * changes its value, the entire group changes as well.
 *
 * `ControlGroup` is one of the three fundamental building blocks used to define forms in Angular,
 * along with [Control] and [ControlArray]. [ControlArray] can also contain other
 * controls, but is of variable length.
 *
 * ### Example ([live demo](http://plnkr.co/edit/23DESOpbNnBpBHZt1BR4?p=preview))
 */
class ControlGroup extends AbstractControl {
  Map<String, AbstractControl> controls;
  Map<String, bool> _optionals;
  ControlGroup(this.controls,
      [Map<String, bool> optionals = null,
      Function validator = Validators.nullValidator])
      : super(validator) {
    /* super call moved to initializer */;
    this._optionals = isPresent(optionals) ? optionals : {};
    this._valueChanges = new EventEmitter();
    this._setParentForControls();
    this.updateValueAndValidity(onlySelf: true, emitEvent: false);
  }
  void addControl(String name, AbstractControl control) {
    this.controls[name] = control;
    control.setParent(this);
  }

  void removeControl(String name) {
    StringMapWrapper.delete(this.controls, name);
  }

  void include(String controlName) {
    StringMapWrapper.set(this._optionals, controlName, true);
    this.updateValueAndValidity();
  }

  void exclude(String controlName) {
    StringMapWrapper.set(this._optionals, controlName, false);
    this.updateValueAndValidity();
  }

  bool contains(String controlName) {
    var c = StringMapWrapper.contains(this.controls, controlName);
    return c && this._included(controlName);
  }

  /** @internal */
  _setParentForControls() {
    StringMapWrapper.forEach(this.controls, (control, name) {
      control.setParent(this);
    });
  }

  /** @internal */
  _updateValue() {
    this._value = this._reduceValue();
  }

  /** @internal */
  _calculateControlsErrors() {
    var res = {};
    StringMapWrapper.forEach(this.controls, (control, name) {
      if (this.contains(name) && isPresent(control.errors)) {
        res[name] = control.errors;
      }
    });
    return StringMapWrapper.isEmpty(res) ? null : res;
  }

  /** @internal */
  _reduceValue() {
    return this._reduceChildren({}, (acc, control, name) {
      acc[name] = control.value;
      return acc;
    });
  }

  /** @internal */
  _reduceChildren(dynamic initValue, Function fn) {
    var res = initValue;
    StringMapWrapper.forEach(this.controls, (control, name) {
      if (this._included(name)) {
        res = fn(res, control, name);
      }
    });
    return res;
  }

  /** @internal */
  bool _included(String controlName) {
    var isOptional = StringMapWrapper.contains(this._optionals, controlName);
    return !isOptional || StringMapWrapper.get(this._optionals, controlName);
  }
}

/**
 * Defines a part of a form, of variable length, that can contain other controls.
 *
 * A `ControlArray` aggregates the values and errors of each [Control] in the group. Thus, if
 * one of the controls in a group is invalid, the entire group is invalid. Similarly, if a control
 * changes its value, the entire group changes as well.
 *
 * `ControlArray` is one of the three fundamental building blocks used to define forms in Angular,
 * along with [Control] and [ControlGroup]. [ControlGroup] can also contain
 * other controls, but is of fixed length.
 *
 *##Adding or removing controls
 *
 * To change the controls in the array, use the `push`, `insert`, or `removeAt` methods
 * in `ControlArray` itself. These methods ensure the controls are properly tracked in the
 * form's hierarchy. Do not modify the array of `AbstractControl`s used to instantiate
 * the `ControlArray` directly, as that will result in strange and unexpected behavior such
 * as broken change detection.
 *
 * ### Example ([live demo](http://plnkr.co/edit/23DESOpbNnBpBHZt1BR4?p=preview))
 */
class ControlArray extends AbstractControl {
  List<AbstractControl> controls;
  ControlArray(this.controls, [Function validator = Validators.nullValidator])
      : super(validator) {
    /* super call moved to initializer */;
    this._valueChanges = new EventEmitter();
    this._setParentForControls();
    this.updateValueAndValidity(onlySelf: true, emitEvent: false);
  }
  /**
   * Get the [AbstractControl] at the given `index` in the array.
   */
  AbstractControl at(num index) {
    return this.controls[index];
  }

  /**
   * Insert a new [AbstractControl] at the end of the array.
   */
  void push(AbstractControl control) {
    this.controls.add(control);
    control.setParent(this);
    this.updateValueAndValidity();
  }

  /**
   * Insert a new [AbstractControl] at the given `index` in the array.
   */
  void insert(num index, AbstractControl control) {
    ListWrapper.insert(this.controls, index, control);
    control.setParent(this);
    this.updateValueAndValidity();
  }

  /**
   * Remove the control at the given `index` in the array.
   */
  void removeAt(num index) {
    ListWrapper.removeAt(this.controls, index);
    this.updateValueAndValidity();
  }

  /**
   * Get the length of the control array.
   */
  num get length {
    return this.controls.length;
  }

  /** @internal */
  void _updateValue() {
    this._value = this.controls.map((control) => control.value).toList();
  }

  /** @internal */
  _calculateControlsErrors() {
    var res = [];
    var anyErrors = false;
    this.controls.forEach((control) {
      res.add(control.errors);
      if (isPresent(control.errors)) {
        anyErrors = true;
      }
    });
    return anyErrors ? res : null;
  }

  /** @internal */
  void _setParentForControls() {
    this.controls.forEach((control) {
      control.setParent(this);
    });
  }
}
