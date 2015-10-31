library angular2.src.core.pipes.number_pipe.ng_deps.dart;

import 'number_pipe.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/facade/lang.dart' show isNumber, isPresent, isBlank, StringWrapper, NumberWrapper, RegExpWrapper, FunctionWrapper;
import 'package:angular2/src/core/facade/exceptions.dart' show BaseException, WrappedException;
import 'package:angular2/src/core/facade/exceptions.ng_deps.dart' as i1;
import 'package:angular2/src/core/facade/intl.dart' show NumberFormatter, NumberFormatStyle;
import 'package:angular2/src/core/facade/intl.ng_deps.dart' as i2;
import 'package:angular2/src/core/di.dart' show Injectable;
import 'package:angular2/src/core/di.ng_deps.dart' as i3;
import 'package:angular2/src/core/change_detection.dart' show PipeTransform, WrappedValue;
import 'package:angular2/src/core/change_detection.ng_deps.dart' as i4;
import 'package:angular2/src/core/metadata.dart' show Pipe;
import 'package:angular2/src/core/metadata.ng_deps.dart' as i5;
import 'package:angular2/src/core/facade/collection.dart' show ListWrapper;
import 'invalid_pipe_argument_exception.dart' show InvalidPipeArgumentException;
import 'invalid_pipe_argument_exception.ng_deps.dart' as i7;
export 'number_pipe.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(NumberPipe, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [],
() => new NumberPipe())
)
..registerType(DecimalPipe, new _ngRef.ReflectionInfo(
const [const Pipe(name: "number"), const Injectable()],
const [],
() => new DecimalPipe(),
const [PipeTransform])
)
..registerType(PercentPipe, new _ngRef.ReflectionInfo(
const [const Pipe(name: "percent"), const Injectable()],
const [],
() => new PercentPipe(),
const [PipeTransform])
)
..registerType(CurrencyPipe, new _ngRef.ReflectionInfo(
const [const Pipe(name: "currency"), const Injectable()],
const [],
() => new CurrencyPipe(),
const [PipeTransform])
)
;
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
i5.initReflector();
i7.initReflector();
}
