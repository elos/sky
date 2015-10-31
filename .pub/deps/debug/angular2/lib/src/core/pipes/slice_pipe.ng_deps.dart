library angular2.src.core.pipes.slice_pipe.ng_deps.dart;

import 'slice_pipe.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/facade/lang.dart' show isBlank, isString, isArray, StringWrapper;
import 'package:angular2/src/core/facade/exceptions.dart' show BaseException;
import 'package:angular2/src/core/facade/exceptions.ng_deps.dart' as i1;
import 'package:angular2/src/core/facade/collection.dart' show ListWrapper;
import 'package:angular2/src/core/di.dart' show Injectable;
import 'package:angular2/src/core/di.ng_deps.dart' as i3;
import 'package:angular2/src/core/change_detection.dart' show PipeTransform, WrappedValue;
import 'package:angular2/src/core/change_detection.ng_deps.dart' as i4;
import 'invalid_pipe_argument_exception.dart' show InvalidPipeArgumentException;
import 'invalid_pipe_argument_exception.ng_deps.dart' as i5;
import '../metadata.dart' show Pipe;
import '../metadata.ng_deps.dart' as i6;
export 'slice_pipe.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(SlicePipe, new _ngRef.ReflectionInfo(
const [const Pipe(name: "slice"), const Injectable()],
const [],
() => new SlicePipe(),
const [PipeTransform])
)
;
i1.initReflector();
i3.initReflector();
i4.initReflector();
i5.initReflector();
i6.initReflector();
}
