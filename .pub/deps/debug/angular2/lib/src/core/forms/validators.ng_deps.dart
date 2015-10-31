library angular2.src.core.forms.validators.ng_deps.dart;

import 'validators.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/facade/lang.dart' show isBlank, isPresent;
import 'package:angular2/src/core/facade/collection.dart' show ListWrapper, StringMapWrapper;
import 'package:angular2/src/core/di.dart' show OpaqueToken;
import 'package:angular2/src/core/di.ng_deps.dart' as i2;
import 'model.dart' as modelModule;
import 'model.ng_deps.dart' as i3;
export 'validators.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i2.initReflector();
i3.initReflector();
}
