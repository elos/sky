library angular2.src.core.pipes.async_pipe.ng_deps.dart;

import 'async_pipe.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/facade/lang.dart' show isBlank, isPresent, isPromise;
import 'package:angular2/src/core/facade/async.dart' show Future, ObservableWrapper, Stream;
import 'package:angular2/src/core/facade/async.ng_deps.dart' as i1;
import 'package:angular2/src/core/metadata.dart' show Pipe;
import 'package:angular2/src/core/metadata.ng_deps.dart' as i2;
import 'package:angular2/src/core/di.dart' show Injectable;
import 'package:angular2/src/core/di.ng_deps.dart' as i3;
import 'package:angular2/src/core/change_detection.dart' show ChangeDetectorRef, PipeOnDestroy, PipeTransform, WrappedValue;
import 'package:angular2/src/core/change_detection.ng_deps.dart' as i4;
import 'invalid_pipe_argument_exception.dart' show InvalidPipeArgumentException;
import 'invalid_pipe_argument_exception.ng_deps.dart' as i5;
export 'async_pipe.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(AsyncPipe, new _ngRef.ReflectionInfo(
const [const Pipe(name: "async", pure: false), const Injectable()],
const [const [ChangeDetectorRef]],
(ChangeDetectorRef _ref) => new AsyncPipe(_ref),
const [PipeTransform, PipeOnDestroy])
)
;
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
i5.initReflector();
}
