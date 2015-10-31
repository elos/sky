library angular2.src.core.forms.form_builder;

import "package:angular2/src/core/di.dart" show Injectable;
import "package:angular2/src/core/facade/collection.dart" show StringMapWrapper;
import "package:angular2/src/core/facade/lang.dart" show isPresent, isArray;
import "model.dart" as modelModule;

/**
 * Creates a form object from a user-specified configuration.
 *
 * ### Example
 *
 * ```
 * import {Component, bootstrap} from 'angular2/angular2';
 * import {FormBuilder, Validators, FORM_DIRECTIVES, ControlGroup} from 'angular2/core';
 *
 * @Component({
 *   selector: 'login-comp',
 *   viewProviders: [FormBuilder],
 *   template: `
 *     <form [control-group]="loginForm">
 *       Login <input control="login">
 *
 *       <div control-group="passwordRetry">
 *         Password <input type="password" control="password">
 *         Confirm password <input type="password" control="passwordConfirmation">
 *       </div>
 *     </form>
 *   `,
 *   directives: [FORM_DIRECTIVES]
 * })
 * class LoginComp {
 *   loginForm: ControlGroup;
 *
 *   constructor(builder: FormBuilder) {
 *     this.loginForm = builder.group({
 *       login: ["", Validators.required],
 *
 *       passwordRetry: builder.group({
 *         password: ["", Validators.required],
 *         passwordConfirmation: ["", Validators.required]
 *       })
 *     });
 *   }
 * }
 *
 * bootstrap(LoginComp);
 * ```
 *
 * This example creates a [ControlGroup] that consists of a `login` [Control], and a
 * nested [ControlGroup] that defines a `password` and a `passwordConfirmation`
 * [Control]:
 *
 * ```
 *  var loginForm = builder.group({
 *    login: ["", Validators.required],
 *
 *    passwordRetry: builder.group({
 *      password: ["", Validators.required],
 *      passwordConfirmation: ["", Validators.required]
 *    })
 *  });
 *
 *  ```
 */
@Injectable()
class FormBuilder {
  modelModule.ControlGroup group(Map<String, dynamic> controlsConfig,
      [Map<String, dynamic> extra = null]) {
    var controls = this._reduceControls(controlsConfig);
    var optionals =
        isPresent(extra) ? StringMapWrapper.get(extra, "optionals") : null;
    var validator =
        isPresent(extra) ? StringMapWrapper.get(extra, "validator") : null;
    if (isPresent(validator)) {
      return new modelModule.ControlGroup(controls, optionals, validator);
    } else {
      return new modelModule.ControlGroup(controls, optionals);
    }
  }

  modelModule.Control control(Object value, [Function validator = null]) {
    if (isPresent(validator)) {
      return new modelModule.Control(value, validator);
    } else {
      return new modelModule.Control(value);
    }
  }

  modelModule.ControlArray array(List<dynamic> controlsConfig,
      [Function validator = null]) {
    var controls = controlsConfig.map((c) => this._createControl(c)).toList();
    if (isPresent(validator)) {
      return new modelModule.ControlArray(controls, validator);
    } else {
      return new modelModule.ControlArray(controls);
    }
  }

  /** @internal */
  Map<String, modelModule.AbstractControl> _reduceControls(
      dynamic controlsConfig) {
    Map<String, modelModule.AbstractControl> controls = {};
    StringMapWrapper.forEach(controlsConfig, (controlConfig, controlName) {
      controls[controlName] = this._createControl(controlConfig);
    });
    return controls;
  }

  /** @internal */
  modelModule.AbstractControl _createControl(dynamic controlConfig) {
    if (controlConfig is modelModule.Control ||
        controlConfig is modelModule.ControlGroup ||
        controlConfig is modelModule.ControlArray) {
      return controlConfig;
    } else if (isArray(controlConfig)) {
      var value = controlConfig[0];
      var validator = controlConfig.length > 1 ? controlConfig[1] : null;
      return this.control(value, validator);
    } else {
      return this.control(controlConfig);
    }
  }
}
