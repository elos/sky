library sky.app;

import 'package:angular2/angular2.dart' show Component, View;
import 'package:angular2/router.dart' show ROUTER_DIRECTIVES, RouteConfig, Route;

import "package:sky/components/components.dart" show LoginComponent, HomeComponent;

part "routes.dart";

@Component(selector: 'app')
@RouteConfig(Routes)
@View(
    template: '''
      <h1> Hello Sky </h1>
      <a [router-link]="['./HomeComponent']">Home</a>
      <router-outlet></router-outlet>
    ''',
    directives: const [ROUTER_DIRECTIVES]
)
class App {
  App();
}
