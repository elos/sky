library angular2.lifecycle_hooks.ng_deps.dart;

import 'lifecycle_hooks.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'src/core/linker/interfaces.ng_deps.dart' as i0;
export 'lifecycle_hooks.dart';
export 'src/core/linker/interfaces.dart' show AfterContentInit, AfterContentChecked, AfterViewInit, AfterViewChecked, OnChanges, OnDestroy, OnInit, DoCheck;
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
}
