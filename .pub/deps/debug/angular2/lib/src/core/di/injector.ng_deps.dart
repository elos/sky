library angular2.src.core.di.injector.ng_deps.dart;

import 'injector.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/facade/collection.dart' show Map, MapWrapper, ListWrapper;
import 'provider.dart' show ResolvedProvider, Provider, Dependency, ProviderBuilder, ResolvedFactory, provide, resolveProviders;
import 'provider.ng_deps.dart' as i1;
import 'exceptions.dart' show AbstractProviderError, NoProviderError, CyclicDependencyError, InstantiationError, InvalidProviderError, OutOfBoundsError;
import 'exceptions.ng_deps.dart' as i2;
import 'package:angular2/src/core/facade/lang.dart' show FunctionWrapper, Type, isPresent, isBlank;
import 'key.dart' show Key;
import 'key.ng_deps.dart' as i4;
import 'metadata.dart' show SelfMetadata, HostMetadata, SkipSelfMetadata;
import 'metadata.ng_deps.dart' as i5;
export 'injector.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i1.initReflector();
i2.initReflector();
i4.initReflector();
i5.initReflector();
}
