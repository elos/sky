library angular2.src.router.router_link.ng_deps.dart;

import 'router_link.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import '../core/metadata.dart' show Directive;
import '../core/metadata.ng_deps.dart' as i0;
import 'package:angular2/src/core/facade/collection.dart' show StringMapWrapper;
import 'router.dart' show Router;
import 'router.ng_deps.dart' as i2;
import 'location.dart' show Location;
import 'location.ng_deps.dart' as i3;
import 'instruction.dart' show Instruction, stringifyInstruction;
import 'instruction.ng_deps.dart' as i4;
export 'router_link.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(RouterLink, new _ngRef.ReflectionInfo(
const [const Directive(host: const {"(click)" : "onClick()", "[attr.href]" : "visibleHref", "[class.router-link-active]" : "isRouteActive"}, inputs: const ["routeParams: routerLink"], selector: "[router-link]")],
const [const [Router], const [Location]],
(Router _router, Location _location) => new RouterLink(_router, _location))
)
..registerSetters({'routeParams': (o, v) => o.routeParams = v})
;
i0.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
}
