library angular2.src.core.forms.model.ng_deps.dart;

import 'model.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/facade/lang.dart' show StringWrapper, isPresent, isBlank, normalizeBool;
import 'package:angular2/src/core/facade/async.dart' show Stream, EventEmitter, ObservableWrapper;
import 'package:angular2/src/core/facade/async.ng_deps.dart' as i1;
import 'package:angular2/src/core/facade/collection.dart' show StringMapWrapper, ListWrapper;
import 'validators.dart' show Validators;
import 'validators.ng_deps.dart' as i3;
export 'model.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i1.initReflector();
i3.initReflector();
}
