library angular2.src.core.forms.directives.ng_control_group;

import "package:angular2/lifecycle_hooks.dart" show OnInit, OnDestroy;
import "package:angular2/src/core/metadata.dart" show Directive;
import "package:angular2/src/core/di.dart"
    show Optional, Inject, Host, SkipSelf, Provider;
import "package:angular2/src/core/facade/collection.dart" show ListWrapper;
import "control_container.dart" show ControlContainer;
import "shared.dart" show controlPath;
import "../model.dart" show ControlGroup;
import "form_interface.dart" show Form;
import "../validators.dart" show Validators, NG_VALIDATORS;

const controlGroupBinding =
    const Provider(ControlContainer, useExisting: NgControlGroup);

/**
 * Creates and binds a control group to a DOM element.
 *
 * This directive can only be used as a child of [NgForm] or [NgFormModel].
 *
 * ### Example
 *
 * In this example, we create the credentials and personal control groups.
 * We can work with each group separately: check its validity, get its value, listen to its changes.
 *
 *  ```
 * @Component({
 *      selector: "signup-comp",
 *      directives: [FORM_DIRECTIVES],
 *      template: `
 *              <form #f="form" (submit)='onSignUp(f.value)'>
 *                <div ng-control-group='credentials' #credentials="form">
 *                  Login <input type='text' ng-control='login'>
 *                  Password <input type='password' ng-control='password'>
 *                </div>
 *                <div *ng-if="!credentials.valid">Credentials are invalid</div>
 *
 *                <div ng-control-group='personal'>
 *                  Name <input type='text' ng-control='name'>
 *                </div>
 *                <button type='submit'>Sign Up!</button>
 *              </form>
 *      `})
 * class SignupComp {
 *  onSignUp(value) {
 *    // value === {
 *    //  personal: {name: 'some name'},
 *    //  credentials: {login: 'some login', password: 'some password'}}
 *  }
 * }
 *
 *  ```
 */
@Directive(
    selector: "[ng-control-group]",
    bindings: const [controlGroupBinding],
    inputs: const ["name: ng-control-group"],
    exportAs: "form")
class NgControlGroup extends ControlContainer implements OnInit, OnDestroy {
  /** @internal */
  ControlContainer _parent;
  List<Function> _validators;
  NgControlGroup(@Host() @SkipSelf() ControlContainer parent,
      @Optional() @Inject(NG_VALIDATORS) List<Function> validators)
      : super() {
    /* super call moved to initializer */;
    this._parent = parent;
    this._validators = validators;
  }
  void onInit() {
    this.formDirective.addControlGroup(this);
  }

  void onDestroy() {
    this.formDirective.removeControlGroup(this);
  }

  ControlGroup get control {
    return this.formDirective.getControlGroup(this);
  }

  List<String> get path {
    return controlPath(this.name, this._parent);
  }

  Form get formDirective {
    return this._parent.formDirective;
  }

  Function get validator {
    return Validators.compose(this._validators);
  }
}
