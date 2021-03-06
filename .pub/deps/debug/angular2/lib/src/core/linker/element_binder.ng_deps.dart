library angular2.src.core.linker.element_binder.ng_deps.dart;

import 'element_binder.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/facade/lang.dart' show isBlank;
import 'package:angular2/src/core/facade/exceptions.dart' show BaseException;
import 'package:angular2/src/core/facade/exceptions.ng_deps.dart' as i1;
import 'element_injector.dart' as eiModule;
import 'element_injector.dart' show DirectiveProvider;
import 'element_injector.ng_deps.dart' as i3;
import 'view.dart' as viewModule;
import 'view.ng_deps.dart' as i4;
export 'element_binder.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i1.initReflector();
i3.initReflector();
i4.initReflector();
}
