library angular2.src.core.metadata.ng_deps.dart;

import 'metadata.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/facade/collection.dart' show List;
import 'package:angular2/src/core/change_detection/change_detection.dart';
import 'package:angular2/src/core/change_detection/change_detection.ng_deps.dart' as i1;
import './metadata/di.dart';
import './metadata/di.ng_deps.dart' as i2;
import './metadata/directives.dart';
import './metadata/directives.ng_deps.dart' as i3;
import './metadata/view.dart';
import './metadata/view.ng_deps.dart' as i4;
export 'metadata.dart';
export './metadata/di.dart';
export './metadata/directives.dart';
export './metadata/view.dart' hide VIEW_ENCAPSULATION_VALUES;
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
}
