library angular2.src.core.forms.directives.ng_form_control;

import "package:angular2/src/core/facade/collection.dart" show StringMapWrapper;
import "package:angular2/src/core/facade/async.dart"
    show EventEmitter, ObservableWrapper;
import "package:angular2/lifecycle_hooks.dart" show OnChanges;
import "package:angular2/src/core/change_detection.dart" show SimpleChange;
import "package:angular2/src/core/metadata.dart" show Query, Directive;
import "package:angular2/src/core/di.dart" show Provider, Inject, Optional;
import "ng_control.dart" show NgControl;
import "../model.dart" show Control;
import "../validators.dart" show Validators, NG_VALIDATORS;
import "control_value_accessor.dart"
    show ControlValueAccessor, NG_VALUE_ACCESSOR;
import "shared.dart"
    show
        setUpControl,
        composeValidators,
        isPropertyUpdated,
        selectValueAccessor;

const formControlBinding =
    const Provider(NgControl, useExisting: NgFormControl);

/**
 * Binds an existing [Control] to a DOM element.
 *
 * ### Example ([live demo](http://plnkr.co/edit/jcQlZ2tTh22BZZ2ucNAT?p=preview))
 *
 * In this example, we bind the control to an input element. When the value of the input element
 * changes, the value of the control will reflect that change. Likewise, if the value of the
 * control changes, the input element reflects that change.
 *
 *  ```typescript
 * @Component({
 *   selector: 'my-app',
 *   template: `
 *     <div>
 *       <h2>NgFormControl Example</h2>
 *       <form>
 *         <p>Element with existing control: <input type="text"
 * [ng-form-control]="loginControl"></p>
 *         <p>Value of existing control: {{loginControl.value}}</p>
 *       </form>
 *     </div>
 *   `,
 *   directives: [CORE_DIRECTIVES, FORM_DIRECTIVES]
 * })
 * export class App {
 *   loginControl: Control = new Control('');
 * }
 *  ```
 *
 *##ng-model
 *
 * We can also use `ng-model` to bind a domain model to the form.
 *
 * ### Example ([live demo](http://plnkr.co/edit/yHMLuHO7DNgT8XvtjTDH?p=preview))
 *
 *  ```typescript
 * @Component({
 *      selector: "login-comp",
 *      directives: [FORM_DIRECTIVES],
 *      template: "<input type='text' [ng-form-control]='loginControl' [(ng-model)]='login'>"
 *      })
 * class LoginComp {
 *  loginControl: Control = new Control('');
 *  login:string;
 * }
 *  ```
 */
@Directive(
    selector: "[ng-form-control]",
    bindings: const [formControlBinding],
    inputs: const ["form: ngFormControl", "model: ngModel"],
    outputs: const ["update: ngModelChange"],
    exportAs: "form")
class NgFormControl extends NgControl implements OnChanges {
  Control form;
  var update = new EventEmitter();
  dynamic model;
  dynamic viewModel;
  Function _validator;
  NgFormControl(
      @Optional()
      @Inject(NG_VALIDATORS)
      /* Array<Validator|Function> */ List<dynamic> validators,
      @Optional()
      @Inject(NG_VALUE_ACCESSOR)
      List<ControlValueAccessor> valueAccessors)
      : super() {
    /* super call moved to initializer */;
    this._validator = composeValidators(validators);
    this.valueAccessor = selectValueAccessor(this, valueAccessors);
  }
  void onChanges(Map<String, SimpleChange> changes) {
    if (this._isControlChanged(changes)) {
      setUpControl(this.form, this);
      this.form.updateValueAndValidity(emitEvent: false);
    }
    if (isPropertyUpdated(changes, this.viewModel)) {
      this.form.updateValue(this.model);
      this.viewModel = this.model;
    }
  }

  List<String> get path {
    return [];
  }

  Function get validator {
    return this._validator;
  }

  Control get control {
    return this.form;
  }

  void viewToModelUpdate(dynamic newValue) {
    this.viewModel = newValue;
    ObservableWrapper.callNext(this.update, newValue);
  }

  bool _isControlChanged(Map<String, dynamic> changes) {
    return StringMapWrapper.contains(changes, "form");
  }
}
