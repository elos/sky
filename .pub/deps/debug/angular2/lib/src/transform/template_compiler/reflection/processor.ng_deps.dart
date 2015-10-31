library angular2.transform.template_compiler.reflection.processor.ng_deps.dart;

import 'processor.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/compiler/directive_metadata.dart';
import 'package:angular2/src/core/compiler/directive_metadata.ng_deps.dart' as i0;
import 'model.dart';
import 'model.ng_deps.dart' as i1;
export 'processor.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
}
