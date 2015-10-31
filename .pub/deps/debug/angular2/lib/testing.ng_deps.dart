library angular2.testing.ng_deps.dart;

import 'testing.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'src/testing/test_component_builder.ng_deps.dart' as i0;
import 'src/testing/test_injector.ng_deps.dart' as i1;
import 'src/testing/fake_async.ng_deps.dart' as i2;
export 'testing.dart';
export 'src/testing/testing.dart';
export 'src/testing/test_component_builder.dart' show RootTestComponent, TestComponentBuilder;
export 'src/testing/test_injector.dart';
export 'src/testing/fake_async.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
}
