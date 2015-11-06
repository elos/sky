library sky.components.home;

import 'dart:async';

import 'package:angular2/angular2.dart' show Component, View;
import 'package:angular2/router.dart' show OnActivate, ComponentInstruction;

@Component(selector: 'home-component')
@View(template: '''
    <div> <h2> Welcome Home </h2> </div>
''')
class HomeComponent implements OnActivate {

  dynamic onActivate(ComponentInstruction nextComponent, ComponentInstruction prevComponent) {
    return new Future.value(true);
  }
}
