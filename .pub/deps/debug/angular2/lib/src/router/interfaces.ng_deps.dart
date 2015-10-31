library angular2.src.router.interfaces.ng_deps.dart;

import 'interfaces.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'instruction.dart' show ComponentInstruction;
import 'instruction.ng_deps.dart' as i0;
import 'package:angular2/src/core/facade/lang.dart' show global;
export 'interfaces.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
}
