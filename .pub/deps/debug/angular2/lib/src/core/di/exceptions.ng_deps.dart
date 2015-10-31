library angular2.src.core.di.exceptions.ng_deps.dart;

import 'exceptions.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/facade/collection.dart' show ListWrapper;
import 'package:angular2/src/core/facade/lang.dart' show stringify, isBlank;
import 'package:angular2/src/core/facade/exceptions.dart' show BaseException, WrappedException, unimplemented;
import 'package:angular2/src/core/facade/exceptions.ng_deps.dart' as i2;
import 'key.dart' show Key;
import 'key.ng_deps.dart' as i3;
import 'injector.dart' show Injector;
import 'injector.ng_deps.dart' as i4;
export 'exceptions.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i2.initReflector();
i3.initReflector();
i4.initReflector();
}
