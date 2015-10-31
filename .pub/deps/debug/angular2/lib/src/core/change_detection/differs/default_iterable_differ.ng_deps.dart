library angular2.src.core.change_detection.differs.default_iterable_differ.ng_deps.dart;

import 'default_iterable_differ.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/facade/exceptions.dart' show BaseException;
import 'package:angular2/src/core/facade/exceptions.ng_deps.dart' as i0;
import 'package:angular2/src/core/facade/collection.dart' show isListLikeIterable, iterateListLike, ListWrapper, MapWrapper;
import 'package:angular2/src/core/facade/lang.dart' show isBlank, isPresent, stringify, getMapKey, looseIdentical, isArray;
import '../change_detector_ref.dart' show ChangeDetectorRef;
import '../change_detector_ref.ng_deps.dart' as i3;
import '../differs/iterable_differs.dart' show IterableDiffer, IterableDifferFactory;
import '../differs/iterable_differs.ng_deps.dart' as i4;
export 'default_iterable_differ.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i3.initReflector();
i4.initReflector();
}
