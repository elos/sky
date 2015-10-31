library angular2.src.core.directives.ng_switch.ng_deps.dart;

import 'ng_switch.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/metadata.dart' show Directive;
import 'package:angular2/src/core/metadata.ng_deps.dart' as i0;
import 'package:angular2/src/core/di.dart' show Host;
import 'package:angular2/src/core/di.ng_deps.dart' as i1;
import 'package:angular2/src/core/linker.dart' show ViewContainerRef, TemplateRef;
import 'package:angular2/src/core/linker.ng_deps.dart' as i2;
import 'package:angular2/src/core/facade/lang.dart' show isPresent, isBlank;
import 'package:angular2/src/core/facade/collection.dart' show ListWrapper, Map;
export 'ng_switch.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(NgSwitch, new _ngRef.ReflectionInfo(
const [const Directive(inputs: const ["ngSwitch"], selector: "[ng-switch]")],
const [],
() => new NgSwitch())
)
..registerType(NgSwitchWhen, new _ngRef.ReflectionInfo(
const [const Directive(inputs: const ["ngSwitchWhen"], selector: "[ng-switch-when]")],
const [const [ViewContainerRef], const [TemplateRef], const [NgSwitch, const Host()]],
(ViewContainerRef viewContainer, TemplateRef templateRef, NgSwitch _switch) => new NgSwitchWhen(viewContainer, templateRef, _switch))
)
..registerType(NgSwitchDefault, new _ngRef.ReflectionInfo(
const [const Directive(selector: "[ng-switch-default]")],
const [const [ViewContainerRef], const [TemplateRef], const [NgSwitch, const Host()]],
(ViewContainerRef viewContainer, TemplateRef templateRef, NgSwitch sswitch) => new NgSwitchDefault(viewContainer, templateRef, sswitch))
)
..registerSetters({'ngSwitch': (o, v) => o.ngSwitch = v, 'ngSwitchWhen': (o, v) => o.ngSwitchWhen = v})
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
}
