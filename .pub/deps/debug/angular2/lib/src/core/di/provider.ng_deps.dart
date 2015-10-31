library angular2.src.core.di.provider.ng_deps.dart;

import 'provider.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/facade/lang.dart' show Type, isBlank, isPresent, stringify, isArray, isType, isFunction, normalizeBool;
import 'package:angular2/src/core/facade/exceptions.dart' show BaseException, WrappedException;
import 'package:angular2/src/core/facade/exceptions.ng_deps.dart' as i1;
import 'package:angular2/src/core/facade/collection.dart' show MapWrapper, ListWrapper;
import 'package:angular2/src/core/reflection/reflection.dart' show reflector;
import 'package:angular2/src/core/reflection/reflection.ng_deps.dart' as i3;
import 'key.dart' show Key;
import 'key.ng_deps.dart' as i4;
import 'metadata.dart' show InjectMetadata, InjectableMetadata, OptionalMetadata, SelfMetadata, HostMetadata, SkipSelfMetadata, DependencyMetadata;
import 'metadata.ng_deps.dart' as i5;
import 'exceptions.dart' show NoAnnotationError, MixingMultiProvidersWithRegularProvidersError, InvalidProviderError;
import 'exceptions.ng_deps.dart' as i6;
import 'forward_ref.dart' show resolveForwardRef;
export 'provider.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i1.initReflector();
i3.initReflector();
i4.initReflector();
i5.initReflector();
i6.initReflector();
}
