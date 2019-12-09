library sky.components.records;

import "dart:async";

import 'package:angular2/angular2.dart'
  show
      Component,
      NgFor,
      View;

import 'package:sky/services/services.dart' as services;

import 'package:data/data.dart' as data;

import 'package:core/models/models.dart' as models
  show
      EventKind;

@Component(selector: 'records-component')
@View(
    directives: const [NgFor],
    templateUrl: 'records.html'
)
class RecordsComponent {
  String currentKind;
  List<String> kinds;


  RecordsComponent() {
    this.kinds = ["event"];
  }

  void selectKind(String kind) {
    if (!this.kinds.contains(kind)) {
      print("That kind is invalid");
    }

    this.currentKind = kind;
  }

  Future<List<data.Record>> records() {
    if (this.currentKind == null) {
      return new Future.value([]);
    }
  }
}
