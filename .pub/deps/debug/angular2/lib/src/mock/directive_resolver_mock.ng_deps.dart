library angular2.src.mock.directive_resolver_mock.ng_deps.dart;

import 'directive_resolver_mock.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/facade/collection.dart' show Map, MapWrapper, ListWrapper;
import 'package:angular2/src/core/facade/lang.dart' show Type, isPresent, stringify, isBlank, print;
import '../core/metadata.dart' show DirectiveMetadata, ComponentMetadata;
import '../core/metadata.ng_deps.dart' as i2;
import 'package:angular2/src/core/linker/directive_resolver.dart' show DirectiveResolver;
import 'package:angular2/src/core/linker/directive_resolver.ng_deps.dart' as i3;
export 'directive_resolver_mock.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i2.initReflector();
i3.initReflector();
}
