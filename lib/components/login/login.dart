library sky.components.login;

import 'package:angular2/angular2.dart'
    show
        Component,
        View,
        FORM_DIRECTIVES,
        CORE_DIRECTIVES,
        Control,
        ControlGroup,
        Validators;

@Component(selector: 'login-component')
@View(
    templateUrl: 'login.html',
    styleUrls: const ['login.css'],
    directives: const [FORM_DIRECTIVES, CORE_DIRECTIVES])
class LoginComponent {
  Control publicCredential;
  Control privateCredential;
  ControlGroup formGroup;

  LoginComponent() {
    this.publicCredential = new Control('', Validators.required);
    this.privateCredential = new Control('', Validators.required);
    this.formGroup = new ControlGroup(
        {'public': this.publicCredential, 'private': this.privateCredential,});
  }

  void submit() {
    print('worls');
  }
}
