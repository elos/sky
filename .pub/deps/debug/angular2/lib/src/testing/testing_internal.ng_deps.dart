library angular2.src.testing.testing_internal.ng_deps.dart;

import 'testing_internal.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'dart:async';
import 'package:guinness/guinness.dart' as gns;
import 'package:angular2/src/core/reflection/reflection.dart';
import 'package:angular2/src/core/reflection/reflection.ng_deps.dart' as i2;
import 'package:angular2/src/core/reflection/reflection_capabilities.dart';
import 'package:angular2/src/core/reflection/reflection_capabilities.ng_deps.dart' as i3;
import 'package:angular2/src/core/di/provider.dart' show bind;
import 'package:angular2/src/core/di/provider.ng_deps.dart' as i4;
import 'package:angular2/src/core/di/injector.dart' show Injector;
import 'package:angular2/src/core/di/injector.ng_deps.dart' as i5;
import 'package:angular2/src/core/facade/collection.dart' show StringMapWrapper;
import 'test_injector.dart';
import 'test_injector.ng_deps.dart' as i7;
import 'matchers.ng_deps.dart' as i13;
export 'testing_internal.dart';
export 'package:guinness/guinness.dart' hide Expect, expect, NotExpect, beforeEach, it, iit, xit, SpyObject, SpyFunction;
export 'matchers.dart' show expect, Expect, NotExpect;
export 'test_injector.dart' show inject;
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i2.initReflector();
i3.initReflector();
i4.initReflector();
i5.initReflector();
i7.initReflector();
i13.initReflector();
}
