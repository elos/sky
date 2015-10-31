library angular2.mock.ng_deps.dart;

import 'mock.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'src/mock/mock_location_strategy.ng_deps.dart' as i0;
import 'package:angular2/src/mock/view_resolver_mock.ng_deps.dart' as i1;
import 'package:angular2/src/core/compiler/xhr_mock.ng_deps.dart' as i2;
export 'mock.dart';
export 'src/mock/mock_location_strategy.dart';
export 'src/router/location_strategy.dart' show LocationStrategy;
export 'package:angular2/src/mock/view_resolver_mock.dart' show MockViewResolver;
export 'package:angular2/src/core/compiler/xhr_mock.dart' show MockXHR;
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
}
