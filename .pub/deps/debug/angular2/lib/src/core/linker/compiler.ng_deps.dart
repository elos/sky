library angular2.src.core.linker.compiler.ng_deps.dart;

import 'compiler.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/linker/view_ref.dart' show ProtoViewRef;
import 'package:angular2/src/core/linker/view_ref.ng_deps.dart' as i0;
import 'package:angular2/src/core/linker/proto_view_factory.dart' show ProtoViewFactory;
import 'package:angular2/src/core/linker/proto_view_factory.ng_deps.dart' as i1;
import 'package:angular2/src/core/di.dart' show Injectable;
import 'package:angular2/src/core/di.ng_deps.dart' as i2;
import 'package:angular2/src/core/facade/lang.dart' show Type, isBlank, stringify;
import 'package:angular2/src/core/facade/exceptions.dart' show BaseException;
import 'package:angular2/src/core/facade/exceptions.ng_deps.dart' as i4;
import 'package:angular2/src/core/facade/async.dart' show Future, PromiseWrapper;
import 'package:angular2/src/core/facade/async.ng_deps.dart' as i5;
import 'package:angular2/src/core/facade/collection.dart' show ListWrapper;
import 'package:angular2/src/core/reflection/reflection.dart' show reflector;
import 'package:angular2/src/core/reflection/reflection.ng_deps.dart' as i7;
import 'package:angular2/src/core/linker/template_commands.dart' show CompiledHostTemplate;
import 'package:angular2/src/core/linker/template_commands.ng_deps.dart' as i8;
export 'compiler.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(Compiler_, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [const [ProtoViewFactory]],
(ProtoViewFactory _protoViewFactory) => new Compiler_(_protoViewFactory))
)
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i4.initReflector();
i5.initReflector();
i7.initReflector();
i8.initReflector();
}
