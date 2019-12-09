library sky.components.home;

import 'dart:async';
import 'dart:html' show WebSocket, MessageEvent;

import 'package:angular2/angular2.dart' show Component, View, NgFor;
import 'package:angular2/router.dart' show OnActivate, ComponentInstruction;

@Component(selector: 'home-component')
@View(template: '''
  <div class="column">
    <ul>
      <li *ng-for="#output of outputStream">
      {{output}}
      </li>
    </ul>
    <input #inputtext>
    <button (click)="sendInput(inputtext.value)">Send</button>
  </div>
''', directives: const [NgFor])
class HomeComponent implements OnActivate {
  // String inputText;

  List<String> outputStream;

  WebSocket sock;

  HomeComponent() {
    this.outputStream = new List<String>();
    outputStream.add("asd");

    this.sock = new WebSocket('ws://0.0.0.0:9999/command/web/?public=public&private=private');
    if (this.sock == null || this.sock.readyState != WebSocket.OPEN) {
      print("shit, the websocket doesn't fucking work");
    }

    this.sock.onError.listen((Event e) {
      print(e);
    });

    this.sock.onMessage.listen((MessageEvent e) {
      print("recieve event");
      this.outputStream.add(e.data);
    });
  }

  sendInput(String input) {
    this.outputStream.add(input);
    print("sending " + input);
    this.sock.send(input);
  }

  dynamic onActivate(ComponentInstruction nextComponent, ComponentInstruction prevComponent) {
    return new Future.value(true);
  }
}
