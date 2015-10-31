library angular2.src.router.route_registry.ng_deps.dart;

import 'route_registry.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'path_recognizer.dart' show PathMatch;
import 'path_recognizer.ng_deps.dart' as i0;
import 'route_recognizer.dart' show RouteRecognizer;
import 'route_recognizer.ng_deps.dart' as i1;
import 'instruction.dart' show Instruction, ComponentInstruction, PrimaryInstruction;
import 'instruction.ng_deps.dart' as i2;
import 'package:angular2/src/core/facade/collection.dart' show ListWrapper, Map, MapWrapper, StringMapWrapper;
import 'package:angular2/src/core/facade/async.dart' show Future, PromiseWrapper;
import 'package:angular2/src/core/facade/async.ng_deps.dart' as i4;
import 'package:angular2/src/core/facade/lang.dart' show isPresent, isBlank, isType, isString, isStringMap, isFunction, StringWrapper, Type, getTypeNameForDebugging;
import 'package:angular2/src/core/facade/exceptions.dart' show BaseException, WrappedException;
import 'package:angular2/src/core/facade/exceptions.ng_deps.dart' as i6;
import 'route_config_impl.dart' show RouteConfig, AsyncRoute, Route, AuxRoute, Redirect, RouteDefinition;
import 'route_config_impl.ng_deps.dart' as i7;
import 'package:angular2/src/core/reflection/reflection.dart' show reflector;
import 'package:angular2/src/core/reflection/reflection.ng_deps.dart' as i8;
import 'package:angular2/angular2.dart' show Injectable;
import 'package:angular2/angular2.ng_deps.dart' as i9;
import 'route_config_nomalizer.dart' show normalizeRouteConfig, assertComponentExists;
import 'route_config_nomalizer.ng_deps.dart' as i10;
import 'url_parser.dart' show parser, Url, pathSegmentsToUrl;
import 'url_parser.ng_deps.dart' as i11;
export 'route_registry.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(RouteRegistry, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [],
() => new RouteRegistry())
)
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i4.initReflector();
i6.initReflector();
i7.initReflector();
i8.initReflector();
i9.initReflector();
i10.initReflector();
i11.initReflector();
}
