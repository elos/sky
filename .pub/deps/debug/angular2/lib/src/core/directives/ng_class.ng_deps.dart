library angular2.src.core.directives.ng_class.ng_deps.dart;

import 'ng_class.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/facade/lang.dart' show isPresent, isString, StringWrapper, isBlank, isArray;
import 'package:angular2/lifecycle_hooks.dart' show DoCheck, OnDestroy;
import 'package:angular2/lifecycle_hooks.ng_deps.dart' as i1;
import 'package:angular2/src/core/metadata.dart' show Directive;
import 'package:angular2/src/core/metadata.ng_deps.dart' as i2;
import 'package:angular2/src/core/linker.dart' show ElementRef;
import 'package:angular2/src/core/linker.ng_deps.dart' as i3;
import 'package:angular2/src/core/change_detection.dart' show IterableDiffer, IterableDiffers, KeyValueDiffer, KeyValueDiffers;
import 'package:angular2/src/core/change_detection.ng_deps.dart' as i4;
import 'package:angular2/src/core/render.dart' show Renderer;
import 'package:angular2/src/core/render.ng_deps.dart' as i5;
import 'package:angular2/src/core/facade/collection.dart' show StringMapWrapper, isListLikeIterable;
export 'ng_class.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(NgClass, new _ngRef.ReflectionInfo(
const [const Directive(inputs: const ["rawClass: ng-class", "initialClasses: class"], selector: "[ng-class]")],
const [const [IterableDiffers], const [KeyValueDiffers], const [ElementRef], const [Renderer]],
(IterableDiffers _iterableDiffers, KeyValueDiffers _keyValueDiffers, ElementRef _ngEl, Renderer _renderer) => new NgClass(_iterableDiffers, _keyValueDiffers, _ngEl, _renderer),
const [DoCheck, OnDestroy])
)
..registerSetters({'rawClass': (o, v) => o.rawClass = v, 'initialClasses': (o, v) => o.initialClasses = v})
;
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
i5.initReflector();
}
