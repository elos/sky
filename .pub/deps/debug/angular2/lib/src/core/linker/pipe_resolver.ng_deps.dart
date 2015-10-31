library angular2.src.core.linker.pipe_resolver.ng_deps.dart;

import 'pipe_resolver.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/di.dart' show resolveForwardRef, Injectable;
import 'package:angular2/src/core/di.ng_deps.dart' as i0;
import 'package:angular2/src/core/facade/lang.dart' show Type, isPresent, stringify;
import 'package:angular2/src/core/facade/collection.dart' show ListWrapper;
import 'package:angular2/src/core/facade/exceptions.dart' show BaseException;
import 'package:angular2/src/core/facade/exceptions.ng_deps.dart' as i3;
import 'package:angular2/src/core/metadata.dart' show PipeMetadata;
import 'package:angular2/src/core/metadata.ng_deps.dart' as i4;
import 'package:angular2/src/core/reflection/reflection.dart' show reflector;
import 'package:angular2/src/core/reflection/reflection.ng_deps.dart' as i5;
export 'pipe_resolver.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(PipeResolver, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [],
() => new PipeResolver())
)
;
i0.initReflector();
i3.initReflector();
i4.initReflector();
i5.initReflector();
}
