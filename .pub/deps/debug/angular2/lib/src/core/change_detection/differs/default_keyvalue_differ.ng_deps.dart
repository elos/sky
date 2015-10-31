library angular2.src.core.change_detection.differs.default_keyvalue_differ.ng_deps.dart;

import 'default_keyvalue_differ.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/facade/collection.dart' show MapWrapper, StringMapWrapper;
import 'package:angular2/src/core/facade/lang.dart' show stringify, looseIdentical, isJsObject, isBlank;
import 'package:angular2/src/core/facade/exceptions.dart' show BaseException;
import 'package:angular2/src/core/facade/exceptions.ng_deps.dart' as i2;
import '../change_detector_ref.dart' show ChangeDetectorRef;
import '../change_detector_ref.ng_deps.dart' as i3;
import '../differs/keyvalue_differs.dart' show KeyValueDiffer, KeyValueDifferFactory;
import '../differs/keyvalue_differs.ng_deps.dart' as i4;
export 'default_keyvalue_differ.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i2.initReflector();
i3.initReflector();
i4.initReflector();
}
