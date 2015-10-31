library angular2.src.router.path_recognizer.ng_deps.dart;

import 'path_recognizer.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/facade/lang.dart' show RegExp, RegExpWrapper, RegExpMatcherWrapper, StringWrapper, isPresent, isBlank;
import 'package:angular2/src/core/facade/exceptions.dart' show BaseException, WrappedException;
import 'package:angular2/src/core/facade/exceptions.ng_deps.dart' as i1;
import 'package:angular2/src/core/facade/collection.dart' show Map, MapWrapper, StringMapWrapper;
import 'route_handler.dart' show RouteHandler;
import 'route_handler.ng_deps.dart' as i3;
import 'url_parser.dart' show Url, RootUrl, serializeParams;
import 'url_parser.ng_deps.dart' as i4;
import 'instruction.dart' show ComponentInstruction, ComponentInstruction_;
import 'instruction.ng_deps.dart' as i5;
export 'path_recognizer.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i1.initReflector();
i3.initReflector();
i4.initReflector();
i5.initReflector();
}
