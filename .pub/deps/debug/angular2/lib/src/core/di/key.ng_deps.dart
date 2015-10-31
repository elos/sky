library angular2.src.core.di.key.ng_deps.dart;

import 'key.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/facade/lang.dart' show stringify, Type, isBlank;
import 'package:angular2/src/core/facade/exceptions.dart' show BaseException, WrappedException;
import 'package:angular2/src/core/facade/exceptions.ng_deps.dart' as i1;
import 'type_literal.dart' show TypeLiteral;
import 'forward_ref.dart' show resolveForwardRef;
export 'key.dart';
export 'type_literal.dart' show TypeLiteral;
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i1.initReflector();
}
