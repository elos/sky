library angular2.src.core.facade.ng_deps.dart;

import 'facade.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'facade/async.ng_deps.dart' as i0;
import 'facade/exceptions.ng_deps.dart' as i1;
export 'facade.dart';
export 'facade/lang.dart' show ConcreteType, Type;
export 'facade/async.dart' show Stream, EventEmitter;
export 'facade/collection.dart' show Predicate;
export 'facade/exceptions.dart' show WrappedException;
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
}
