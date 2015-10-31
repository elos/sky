library angular2.src.core.directives.ng_if.ng_deps.dart;

import 'ng_if.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/metadata.dart' show Directive;
import 'package:angular2/src/core/metadata.ng_deps.dart' as i0;
import 'package:angular2/src/core/linker.dart' show ViewContainerRef, TemplateRef;
import 'package:angular2/src/core/linker.ng_deps.dart' as i1;
import 'package:angular2/src/core/facade/lang.dart' show isBlank;
export 'ng_if.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(NgIf, new _ngRef.ReflectionInfo(
const [const Directive(inputs: const ["ngIf"], selector: "[ng-if]")],
const [const [ViewContainerRef], const [TemplateRef]],
(ViewContainerRef _viewContainer, TemplateRef _templateRef) => new NgIf(_viewContainer, _templateRef))
)
..registerSetters({'ngIf': (o, v) => o.ngIf = v})
;
i0.initReflector();
i1.initReflector();
}
