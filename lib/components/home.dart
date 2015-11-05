part of sky.components;

@Component(selector: 'home-component')
@View(template: '''
    <div> <h2> Welcome Home </h2> </div>
''')
class HomeComponent implements OnActivate {

  dynamic onActivate(ComponentInstruction nextComponent, ComponentInstruction prevComponent) {
    return new Future.value(true);
  }
}
