library angular2.src.core.compiler.directive_metadata.ng_deps.dart;

import 'directive_metadata.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/facade/lang.dart' show isPresent, isBlank, normalizeBool, serializeEnum, Type, RegExpWrapper, StringWrapper;
import 'package:angular2/src/core/facade/collection.dart' show StringMapWrapper;
import 'package:angular2/src/core/change_detection/change_detection.dart' show ChangeDetectionStrategy, CHANGE_DETECTION_STRATEGY_VALUES;
import 'package:angular2/src/core/change_detection/change_detection.ng_deps.dart' as i2;
import 'package:angular2/src/core/metadata/view.dart' show ViewEncapsulation, VIEW_ENCAPSULATION_VALUES;
import 'package:angular2/src/core/metadata/view.ng_deps.dart' as i3;
import 'package:angular2/src/core/compiler/selector.dart' show CssSelector;
import 'package:angular2/src/core/compiler/selector.ng_deps.dart' as i4;
import 'util.dart' show splitAtColon;
import 'util.ng_deps.dart' as i5;
import 'package:angular2/src/core/linker/interfaces.dart' show LifecycleHooks, LIFECYCLE_HOOKS_VALUES;
import 'package:angular2/src/core/linker/interfaces.ng_deps.dart' as i6;
export 'directive_metadata.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i2.initReflector();
i3.initReflector();
i4.initReflector();
i5.initReflector();
i6.initReflector();
}
