library angular2.src.core.directives.ng_for.ng_deps.dart;

import 'ng_for.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/lifecycle_hooks.dart' show DoCheck;
import 'package:angular2/lifecycle_hooks.ng_deps.dart' as i0;
import 'package:angular2/src/core/metadata.dart' show Directive;
import 'package:angular2/src/core/metadata.ng_deps.dart' as i1;
import 'package:angular2/src/core/change_detection.dart' show ChangeDetectorRef, IterableDiffer, IterableDiffers;
import 'package:angular2/src/core/change_detection.ng_deps.dart' as i2;
import 'package:angular2/src/core/linker.dart' show ViewContainerRef, TemplateRef, ViewRef;
import 'package:angular2/src/core/linker.ng_deps.dart' as i3;
import 'package:angular2/src/core/facade/lang.dart' show isPresent, isBlank;
export 'ng_for.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(NgFor, new _ngRef.ReflectionInfo(
const [const Directive(inputs: const ["ngForOf", "ngForTemplate"], selector: "[ng-for][ng-for-of]")],
const [const [ViewContainerRef], const [TemplateRef], const [IterableDiffers], const [ChangeDetectorRef]],
(ViewContainerRef _viewContainer, TemplateRef _templateRef, IterableDiffers _iterableDiffers, ChangeDetectorRef _cdr) => new NgFor(_viewContainer, _templateRef, _iterableDiffers, _cdr),
const [DoCheck])
)
..registerSetters({'ngForOf': (o, v) => o.ngForOf = v, 'ngForTemplate': (o, v) => o.ngForTemplate = v})
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
}
