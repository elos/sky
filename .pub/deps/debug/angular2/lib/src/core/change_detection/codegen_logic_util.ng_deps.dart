library angular2.src.core.change_detection.codegen_logic_util.ng_deps.dart;

import 'codegen_logic_util.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/facade/lang.dart' show Json, StringWrapper, isPresent, isBlank;
import 'codegen_name_util.dart' show CodegenNameUtil;
import 'codegen_name_util.ng_deps.dart' as i1;
import 'codegen_facade.dart' show codify, combineGeneratedStrings, rawString;
import 'proto_record.dart' show ProtoRecord, RecordType;
import 'proto_record.ng_deps.dart' as i3;
import 'binding_record.dart' show BindingTarget;
import 'binding_record.ng_deps.dart' as i4;
import 'directive_record.dart' show DirectiveRecord;
import 'directive_record.ng_deps.dart' as i5;
import 'constants.dart' show ChangeDetectionStrategy;
import 'constants.ng_deps.dart' as i6;
import 'package:angular2/src/core/facade/exceptions.dart' show BaseException;
import 'package:angular2/src/core/facade/exceptions.ng_deps.dart' as i7;
export 'codegen_logic_util.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i1.initReflector();
i3.initReflector();
i4.initReflector();
i5.initReflector();
i6.initReflector();
i7.initReflector();
}
