library angular2.router.ng_deps.dart;

import 'router.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'src/router/location_strategy.dart' show LocationStrategy;
import 'src/router/path_location_strategy.dart' show PathLocationStrategy;
import 'src/router/path_location_strategy.ng_deps.dart' as i1;
import 'src/router/router.dart' show Router, RootRouter;
import 'src/router/router.ng_deps.dart' as i2;
import 'src/router/router_outlet.dart' show RouterOutlet;
import 'src/router/router_outlet.ng_deps.dart' as i3;
import 'src/router/router_link.dart' show RouterLink;
import 'src/router/router_link.ng_deps.dart' as i4;
import 'src/router/route_registry.dart' show RouteRegistry;
import 'src/router/route_registry.ng_deps.dart' as i5;
import 'src/router/location.dart' show Location;
import 'src/router/location.ng_deps.dart' as i6;
import 'package:angular2/angular2.dart' show ApplicationRef, provide, OpaqueToken, Provider;
import 'package:angular2/angular2.ng_deps.dart' as i7;
import 'package:angular2/src/core/facade/exceptions.dart' show BaseException;
import 'package:angular2/src/core/facade/exceptions.ng_deps.dart' as i8;
import 'src/router/instruction.ng_deps.dart' as i17;
import 'src/router/hash_location_strategy.ng_deps.dart' as i18;
import 'src/router/route_config_decorator.ng_deps.dart' as i19;
import 'src/router/interfaces.ng_deps.dart' as i20;
import 'src/router/lifecycle_annotations.ng_deps.dart' as i21;
export 'router.dart';
export 'src/router/router.dart' show Router;
export 'src/router/router_outlet.dart' show RouterOutlet;
export 'src/router/router_link.dart' show RouterLink;
export 'src/router/instruction.dart' show RouteParams, RouteData;
export 'src/router/route_registry.dart' show RouteRegistry;
export 'src/router/location_strategy.dart' show LocationStrategy;
export 'src/router/hash_location_strategy.dart' show HashLocationStrategy;
export 'src/router/path_location_strategy.dart' show PathLocationStrategy;
export 'src/router/location.dart' show Location, APP_BASE_HREF;
export 'src/router/route_config_decorator.dart';
export 'src/router/route_definition.dart';
export 'src/router/interfaces.dart' show OnActivate, OnDeactivate, OnReuse, CanDeactivate, CanReuse;
export 'src/router/lifecycle_annotations.dart' show CanActivate;
export 'src/router/instruction.dart' show Instruction, ComponentInstruction;
export 'package:angular2/angular2.dart' show OpaqueToken;
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerGetters({'update': (o) => o.update, 'ngSubmit': (o) => o.ngSubmit})
..registerSetters({'routeParams': (o, v) => o.routeParams = v, 'rawClass': (o, v) => o.rawClass = v, 'initialClasses': (o, v) => o.initialClasses = v, 'ngForOf': (o, v) => o.ngForOf = v, 'ngForTemplate': (o, v) => o.ngForTemplate = v, 'ngIf': (o, v) => o.ngIf = v, 'rawStyle': (o, v) => o.rawStyle = v, 'ngSwitch': (o, v) => o.ngSwitch = v, 'ngSwitchWhen': (o, v) => o.ngSwitchWhen = v, 'name': (o, v) => o.name = v, 'model': (o, v) => o.model = v, 'form': (o, v) => o.form = v})
;
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
i5.initReflector();
i6.initReflector();
i7.initReflector();
i8.initReflector();
i17.initReflector();
i18.initReflector();
i19.initReflector();
i20.initReflector();
i21.initReflector();
}
