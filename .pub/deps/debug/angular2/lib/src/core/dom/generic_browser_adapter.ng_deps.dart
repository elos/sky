library angular2.src.core.dom.generic_browser_adapter.ng_deps.dart;

import 'generic_browser_adapter.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/facade/collection.dart' show ListWrapper, StringMapWrapper;
import 'package:angular2/src/core/facade/lang.dart' show isPresent, isFunction, StringWrapper, Type;
import 'dom_adapter.dart' show DomAdapter;
import 'dom_adapter.ng_deps.dart' as i2;
import 'package:angular2/src/core/compiler/xhr_impl.dart' show XHRImpl;
import 'package:angular2/src/core/compiler/xhr_impl.ng_deps.dart' as i3;
export 'generic_browser_adapter.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i2.initReflector();
i3.initReflector();
}
