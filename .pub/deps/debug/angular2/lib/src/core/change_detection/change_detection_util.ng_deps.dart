library angular2.src.core.change_detection.change_detection_util.ng_deps.dart;

import 'change_detection_util.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/facade/lang.dart' show isPresent, isBlank, Type, StringWrapper, looseIdentical;
import 'package:angular2/src/core/facade/exceptions.dart' show BaseException;
import 'package:angular2/src/core/facade/exceptions.ng_deps.dart' as i1;
import 'package:angular2/src/core/facade/collection.dart' show ListWrapper, MapWrapper, StringMapWrapper;
import 'proto_record.dart' show ProtoRecord;
import 'proto_record.ng_deps.dart' as i3;
import 'constants.dart' show ChangeDetectionStrategy, isDefaultChangeDetectionStrategy;
import 'constants.ng_deps.dart' as i4;
import 'pipe_lifecycle_reflector.dart' show implementsOnDestroy;
import 'pipe_lifecycle_reflector.ng_deps.dart' as i5;
import 'binding_record.dart' show BindingTarget;
import 'binding_record.ng_deps.dart' as i6;
import 'directive_record.dart' show DirectiveIndex;
import 'directive_record.ng_deps.dart' as i7;
import 'pipes.dart' show SelectedPipe;
import 'pipes.ng_deps.dart' as i8;
export 'change_detection_util.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i1.initReflector();
i3.initReflector();
i4.initReflector();
i5.initReflector();
i6.initReflector();
i7.initReflector();
i8.initReflector();
}
