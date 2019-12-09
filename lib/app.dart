library sky.app;

import 'package:angular2/angular2.dart' show Component, View;
import 'package:angular2/router.dart' show ROUTER_DIRECTIVES, RouteConfig, Route, Redirect;

import "package:sky/components/components.dart" show LoginComponent, HomeComponent, RecordsComponent;

part "routes.dart";

@Component(selector: 'app')
@RouteConfig(Routes)
@View(
    templateUrl: 'app.html',
    directives: const [ROUTER_DIRECTIVES],
    styleUrls: const ['app.css']
)
class App {
  App();
}
