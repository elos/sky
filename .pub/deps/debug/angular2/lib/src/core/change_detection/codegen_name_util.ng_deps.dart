library angular2.src.core.change_detection.codegen_name_util.ng_deps.dart;

import 'codegen_name_util.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/facade/lang.dart' show RegExpWrapper, StringWrapper;
import 'package:angular2/src/core/facade/collection.dart' show ListWrapper, MapWrapper, Map;
import 'directive_record.dart' show DirectiveIndex;
import 'directive_record.ng_deps.dart' as i2;
import 'proto_record.dart' show ProtoRecord;
import 'proto_record.ng_deps.dart' as i3;
import 'event_binding.dart' show EventBinding;
import 'event_binding.ng_deps.dart' as i4;
export 'codegen_name_util.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i2.initReflector();
i3.initReflector();
i4.initReflector();
}
