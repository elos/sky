library angular2.src.router.instruction.ng_deps.dart;

import 'instruction.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/facade/collection.dart' show Map, MapWrapper, StringMapWrapper, ListWrapper;
import 'package:angular2/src/core/facade/exceptions.dart' show unimplemented;
import 'package:angular2/src/core/facade/exceptions.ng_deps.dart' as i1;
import 'package:angular2/src/core/facade/lang.dart' show isPresent, isBlank, Type;
import 'package:angular2/src/core/facade/async.dart' show Future;
import 'package:angular2/src/core/facade/async.ng_deps.dart' as i3;
import 'path_recognizer.dart' show PathRecognizer;
import 'path_recognizer.ng_deps.dart' as i4;
import 'url_parser.dart' show Url;
import 'url_parser.ng_deps.dart' as i5;
export 'instruction.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i1.initReflector();
i3.initReflector();
i4.initReflector();
i5.initReflector();
}
