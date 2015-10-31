library angular2.src.core.compiler.runtime_metadata.ng_deps.dart;

import 'runtime_metadata.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/di.dart' show resolveForwardRef;
import 'package:angular2/src/core/facade/lang.dart' show Type, isBlank, isPresent, isArray, stringify, RegExpWrapper;
import 'package:angular2/src/core/facade/exceptions.dart' show BaseException;
import 'package:angular2/src/core/facade/exceptions.ng_deps.dart' as i2;
import 'package:angular2/src/core/facade/collection.dart' show MapWrapper, StringMapWrapper, ListWrapper;
import 'directive_metadata.dart' as cpl;
import 'directive_metadata.ng_deps.dart' as i4;
import 'package:angular2/src/core/metadata/directives.dart' as md;
import 'package:angular2/src/core/metadata/directives.ng_deps.dart' as i5;
import 'package:angular2/src/core/linker/directive_resolver.dart' show DirectiveResolver;
import 'package:angular2/src/core/linker/directive_resolver.ng_deps.dart' as i6;
import 'package:angular2/src/core/linker/view_resolver.dart' show ViewResolver;
import 'package:angular2/src/core/linker/view_resolver.ng_deps.dart' as i7;
import 'package:angular2/src/core/metadata/view.dart' show ViewMetadata;
import 'package:angular2/src/core/metadata/view.ng_deps.dart' as i8;
import 'package:angular2/src/core/linker/directive_lifecycle_reflector.dart' show hasLifecycleHook;
import 'package:angular2/src/core/linker/directive_lifecycle_reflector.ng_deps.dart' as i9;
import 'package:angular2/src/core/linker/interfaces.dart' show LifecycleHooks, LIFECYCLE_HOOKS_VALUES;
import 'package:angular2/src/core/linker/interfaces.ng_deps.dart' as i10;
import 'package:angular2/src/core/reflection/reflection.dart' show reflector;
import 'package:angular2/src/core/reflection/reflection.ng_deps.dart' as i11;
import 'package:angular2/src/core/di.dart' show Injectable;
import 'package:angular2/src/core/di.ng_deps.dart' as i12;
import 'util.dart' show MODULE_SUFFIX;
import 'util.ng_deps.dart' as i13;
export 'runtime_metadata.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(RuntimeMetadataResolver, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [const [DirectiveResolver], const [ViewResolver]],
(DirectiveResolver _directiveResolver, ViewResolver _viewResolver) => new RuntimeMetadataResolver(_directiveResolver, _viewResolver))
)
;
i2.initReflector();
i4.initReflector();
i5.initReflector();
i6.initReflector();
i7.initReflector();
i8.initReflector();
i9.initReflector();
i10.initReflector();
i11.initReflector();
i12.initReflector();
i13.initReflector();
}
