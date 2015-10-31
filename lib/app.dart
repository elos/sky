library sky.app;

import 'dart:async';

import 'package:angular2/angular2.dart' show Component, View;
import 'package:angular2/router.dart' show ROUTER_DIRECTIVES, RouteConfig;

@Component(selector: 'app')
@RouteConfig(const [])
@View(
    template: '''
      <h1> Hello Sky </h1>
    ''',
    directives: const [ROUTER_DIRECTIVES]
)
class App {
  App();
}
