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

import 'package:angular2/router.dart' as r
    show OnActivate, ComponentInstruction, Location, Router;

import 'package:sky/services/services.dart' as services show SessionService;

@Component(selector: 'login-component')
@View(
    templateUrl: 'login.html',
    styleUrls: const ['login.css'],
    directives: const [FORM_DIRECTIVES, CORE_DIRECTIVES])
class LoginComponent implements r.OnActivate {
  services.SessionService sessionService;
  r.Location location;
  r.Router router;

  Control publicCredential;
  Control privateCredential;
  ControlGroup formGroup;

  _instantiateControls() {
    this.publicCredential = new Control('', Validators.required);
    this.privateCredential = new Control('', Validators.required);
    this.formGroup = new ControlGroup(
        {'public': this.publicCredential, 'private': this.privateCredential,});
  }

  LoginComponent(services.SessionService this.sessionService,
      r.Location this.location, r.Router this.router) {
    this._instantiateControls();
  }

  void submit() {
    services.SessionService
        .authenticate(publicCredential.value, privateCredential.value)
        .then((session) {
      this.sessionService.setSession(session);
      this.router.navigate(['../HomeComponent']);
      //this.location.go('/home');
    }).catchError((e) {
      print(e);
    });
    print('worls');
  }

  void onActivate(r.ComponentInstruction next, r.ComponentInstruction prev) {
    if (sessionService.isAuthenticated()) {
      print('You are already authenticated');
      this.location.go('/home');
    }
  }
}
