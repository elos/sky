library angular2.src.core.platform_bindings.ng_deps.dart;

import 'platform_bindings.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/core.dart';
import 'package:angular2/core.ng_deps.dart' as i0;
import 'package:angular2/src/core/facade/exceptions.dart';
import 'package:angular2/src/core/facade/exceptions.ng_deps.dart' as i1;
import 'package:angular2/src/core/dom/dom_adapter.dart';
import 'package:angular2/src/core/dom/dom_adapter.ng_deps.dart' as i2;
export 'platform_bindings.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
}
