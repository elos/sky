library angular2.src.core.pipes.uppercase_pipe.ng_deps.dart;

import 'uppercase_pipe.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/facade/lang.dart' show isString, StringWrapper, isBlank;
import 'package:angular2/src/core/metadata.dart' show Pipe;
import 'package:angular2/src/core/metadata.ng_deps.dart' as i1;
import 'package:angular2/src/core/di.dart' show Injectable;
import 'package:angular2/src/core/di.ng_deps.dart' as i2;
import 'package:angular2/src/core/change_detection.dart' show PipeTransform, WrappedValue;
import 'package:angular2/src/core/change_detection.ng_deps.dart' as i3;
import 'invalid_pipe_argument_exception.dart' show InvalidPipeArgumentException;
import 'invalid_pipe_argument_exception.ng_deps.dart' as i4;
export 'uppercase_pipe.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(UpperCasePipe, new _ngRef.ReflectionInfo(
const [const Pipe(name: "uppercase"), const Injectable()],
const [],
() => new UpperCasePipe(),
const [PipeTransform])
)
;
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
}
