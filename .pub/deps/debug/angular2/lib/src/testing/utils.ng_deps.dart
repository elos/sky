library angular2.src.testing.utils.ng_deps.dart;

import 'utils.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/facade/collection.dart' show ListWrapper, MapWrapper;
import 'package:angular2/src/core/dom/dom_adapter.dart' show DOM;
import 'package:angular2/src/core/dom/dom_adapter.ng_deps.dart' as i1;
import 'package:angular2/src/core/facade/lang.dart' show isPresent, isString, RegExpWrapper, StringWrapper, RegExp;
export 'utils.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i1.initReflector();
}
