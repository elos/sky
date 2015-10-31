library angular2.src.core.pipes.date_pipe.ng_deps.dart;

import 'date_pipe.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/facade/lang.dart' show isDate, isNumber, isPresent, DateTime, DateWrapper, isBlank, FunctionWrapper;
import 'package:angular2/src/core/facade/intl.dart' show DateFormatter;
import 'package:angular2/src/core/facade/intl.ng_deps.dart' as i1;
import 'package:angular2/src/core/di.dart' show Injectable;
import 'package:angular2/src/core/di.ng_deps.dart' as i2;
import 'package:angular2/src/core/metadata.dart' show Pipe;
import 'package:angular2/src/core/metadata.ng_deps.dart' as i3;
import 'package:angular2/src/core/change_detection.dart' show PipeTransform, WrappedValue;
import 'package:angular2/src/core/change_detection.ng_deps.dart' as i4;
import 'package:angular2/src/core/facade/collection.dart' show StringMapWrapper, ListWrapper;
import 'invalid_pipe_argument_exception.dart' show InvalidPipeArgumentException;
import 'invalid_pipe_argument_exception.ng_deps.dart' as i6;
export 'date_pipe.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(DatePipe, new _ngRef.ReflectionInfo(
const [const Pipe(name: "date"), const Injectable()],
const [],
() => new DatePipe(),
const [PipeTransform])
)
;
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
i6.initReflector();
}
