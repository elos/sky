library angular2.src.router.route_recognizer.ng_deps.dart;

import 'route_recognizer.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/facade/lang.dart' show RegExp, RegExpWrapper, StringWrapper, isBlank, isPresent, isType, isStringMap, Type;
import 'package:angular2/src/core/facade/exceptions.dart' show BaseException, WrappedException;
import 'package:angular2/src/core/facade/exceptions.ng_deps.dart' as i1;
import 'package:angular2/src/core/facade/collection.dart' show Map, MapWrapper, ListWrapper, StringMapWrapper;
import 'path_recognizer.dart' show PathRecognizer, PathMatch;
import 'path_recognizer.ng_deps.dart' as i3;
import 'route_config_impl.dart' show Route, AsyncRoute, AuxRoute, Redirect, RouteDefinition;
import 'route_config_impl.ng_deps.dart' as i4;
import 'async_route_handler.dart' show AsyncRouteHandler;
import 'async_route_handler.ng_deps.dart' as i5;
import 'sync_route_handler.dart' show SyncRouteHandler;
import 'sync_route_handler.ng_deps.dart' as i6;
import 'url_parser.dart' show Url;
import 'url_parser.ng_deps.dart' as i7;
import 'instruction.dart' show ComponentInstruction;
import 'instruction.ng_deps.dart' as i8;
export 'route_recognizer.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i1.initReflector();
i3.initReflector();
i4.initReflector();
i5.initReflector();
i6.initReflector();
i7.initReflector();
i8.initReflector();
}
