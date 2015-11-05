// Standard Library Imports
import "dart:html";

// App Imports
import 'package:sky/app.dart' show App;

// Angular Imports
import 'package:angular2/angular2.dart' show provide;
import 'package:angular2/bootstrap.dart' show bootstrap;
import 'package:angular2/router.dart' show APP_BASE_HREF, ROUTER_PROVIDERS, LocationStrategy, HashLocationStrategy;

main() {
  bootstrap(App,
      [ROUTER_PROVIDERS, provide(APP_BASE_HREF, useValue: window.location.pathname),
      provide(LocationStrategy, useClass: HashLocationStrategy)]
  );
}
