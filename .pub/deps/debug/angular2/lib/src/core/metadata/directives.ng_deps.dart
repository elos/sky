library angular2.src.core.metadata.directives.ng_deps.dart;

import 'directives.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/facade/lang.dart' show isPresent, Type;
import 'package:angular2/src/core/di/metadata.dart' show InjectableMetadata;
import 'package:angular2/src/core/di/metadata.ng_deps.dart' as i1;
import 'package:angular2/src/core/change_detection.dart' show ChangeDetectionStrategy;
import 'package:angular2/src/core/change_detection.ng_deps.dart' as i2;
import 'package:angular2/src/core/metadata/view.dart' show ViewEncapsulation;
import 'package:angular2/src/core/metadata/view.ng_deps.dart' as i3;
export 'directives.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i1.initReflector();
i2.initReflector();
i3.initReflector();
}
