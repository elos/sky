library angular2.src.core.compiler.xhr_mock.ng_deps.dart;

import 'xhr_mock.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/compiler/xhr.dart' show XHR;
import 'package:angular2/src/core/compiler/xhr.ng_deps.dart' as i0;
import 'package:angular2/src/core/facade/collection.dart' show ListWrapper, Map, MapWrapper;
import 'package:angular2/src/core/facade/lang.dart' show isBlank, isPresent;
import 'package:angular2/src/core/facade/exceptions.dart' show BaseException, WrappedException;
import 'package:angular2/src/core/facade/exceptions.ng_deps.dart' as i3;
import 'package:angular2/src/core/facade/async.dart' show PromiseCompleter, PromiseWrapper, Future;
import 'package:angular2/src/core/facade/async.ng_deps.dart' as i4;
export 'xhr_mock.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i3.initReflector();
i4.initReflector();
}
