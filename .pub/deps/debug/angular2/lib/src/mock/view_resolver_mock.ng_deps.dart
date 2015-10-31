library angular2.src.mock.view_resolver_mock.ng_deps.dart;

import 'view_resolver_mock.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/facade/collection.dart' show Map, MapWrapper, ListWrapper;
import 'package:angular2/src/core/facade/lang.dart' show Type, isPresent, stringify, isBlank;
import 'package:angular2/src/core/facade/exceptions.dart' show BaseException, WrappedException;
import 'package:angular2/src/core/facade/exceptions.ng_deps.dart' as i2;
import '../core/metadata.dart' show ViewMetadata;
import '../core/metadata.ng_deps.dart' as i3;
import 'package:angular2/src/core/linker/view_resolver.dart' show ViewResolver;
import 'package:angular2/src/core/linker/view_resolver.ng_deps.dart' as i4;
export 'view_resolver_mock.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i2.initReflector();
i3.initReflector();
i4.initReflector();
}
