library angular2.src.core.change_detection.change_detection.ng_deps.dart;

import 'change_detection.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'differs/iterable_differs.dart' show IterableDiffers, IterableDifferFactory;
import 'differs/iterable_differs.ng_deps.dart' as i0;
import 'differs/default_iterable_differ.dart' show DefaultIterableDifferFactory;
import 'differs/default_iterable_differ.ng_deps.dart' as i1;
import 'differs/keyvalue_differs.dart' show KeyValueDiffers, KeyValueDifferFactory;
import 'differs/keyvalue_differs.ng_deps.dart' as i2;
import 'differs/default_keyvalue_differ.dart' show DefaultKeyValueDifferFactory;
import 'differs/default_keyvalue_differ.ng_deps.dart' as i3;
import 'package:angular2/src/core/facade/lang.dart' show isPresent;
import 'parser/ast.ng_deps.dart' as i9;
import 'parser/lexer.ng_deps.dart' as i10;
import 'parser/parser.ng_deps.dart' as i11;
import 'parser/locals.ng_deps.dart' as i12;
import 'exceptions.ng_deps.dart' as i13;
import 'interfaces.ng_deps.dart' as i14;
import 'constants.ng_deps.dart' as i15;
import 'proto_change_detector.ng_deps.dart' as i16;
import 'jit_proto_change_detector.ng_deps.dart' as i17;
import 'binding_record.ng_deps.dart' as i18;
import 'directive_record.ng_deps.dart' as i19;
import 'dynamic_change_detector.ng_deps.dart' as i20;
import 'change_detector_ref.ng_deps.dart' as i21;
import 'change_detection_util.ng_deps.dart' as i22;
export 'change_detection.dart';
export 'parser/ast.dart' show ASTWithSource, AST, AstTransformer, PropertyRead, LiteralArray, ImplicitReceiver;
export 'parser/lexer.dart' show Lexer;
export 'parser/parser.dart' show Parser;
export 'parser/locals.dart' show Locals;
export 'exceptions.dart' show DehydratedException, ExpressionChangedAfterItHasBeenCheckedException, ChangeDetectionError;
export 'interfaces.dart' show ProtoChangeDetector, ChangeDetector, ChangeDispatcher, ChangeDetectorDefinition, DebugContext, ChangeDetectorGenConfig;
export 'constants.dart' show ChangeDetectionStrategy, CHANGE_DETECTION_STRATEGY_VALUES;
export 'proto_change_detector.dart' show DynamicProtoChangeDetector;
export 'jit_proto_change_detector.dart' show JitProtoChangeDetector;
export 'binding_record.dart' show BindingRecord, BindingTarget;
export 'directive_record.dart' show DirectiveIndex, DirectiveRecord;
export 'dynamic_change_detector.dart' show DynamicChangeDetector;
export 'change_detector_ref.dart' show ChangeDetectorRef;
export 'differs/iterable_differs.dart' show IterableDiffers, IterableDiffer, IterableDifferFactory;
export 'differs/keyvalue_differs.dart' show KeyValueDiffers, KeyValueDiffer, KeyValueDifferFactory;
export 'pipe_transform.dart' show PipeTransform, PipeOnDestroy;
export 'change_detection_util.dart' show WrappedValue, SimpleChange;
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i9.initReflector();
i10.initReflector();
i11.initReflector();
i12.initReflector();
i13.initReflector();
i14.initReflector();
i15.initReflector();
i16.initReflector();
i17.initReflector();
i18.initReflector();
i19.initReflector();
i20.initReflector();
i21.initReflector();
i22.initReflector();
}
