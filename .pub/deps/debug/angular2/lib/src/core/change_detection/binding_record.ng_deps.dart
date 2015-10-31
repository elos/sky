library angular2.src.core.change_detection.binding_record.ng_deps.dart;

import 'binding_record.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/facade/lang.dart' show isPresent, isBlank;
import 'package:angular2/src/core/reflection/types.dart' show SetterFn;
import 'parser/ast.dart' show AST;
import 'parser/ast.ng_deps.dart' as i2;
import 'directive_record.dart' show DirectiveIndex, DirectiveRecord;
import 'directive_record.ng_deps.dart' as i3;
export 'binding_record.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i2.initReflector();
i3.initReflector();
}
