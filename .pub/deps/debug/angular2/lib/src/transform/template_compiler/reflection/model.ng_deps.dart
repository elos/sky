library angular2.transform.template_compiler.reflection.model.ng_deps.dart;

import 'model.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/compiler/util.dart';
import 'package:angular2/src/core/compiler/util.ng_deps.dart' as i0;
import 'package:angular2/src/core/linker/event_config.dart';
import 'package:angular2/src/core/linker/event_config.ng_deps.dart' as i1;
export 'model.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
}
