library angular2.ng_deps.dart;

import 'angular2.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/core.ng_deps.dart' as i0;
import 'package:angular2/profile.ng_deps.dart' as i1;
import 'package:angular2/lifecycle_hooks.ng_deps.dart' as i2;
import 'package:angular2/src/core/application_tokens.ng_deps.dart' as i3;
import 'package:angular2/src/core/render/dom/dom_tokens.ng_deps.dart' as i4;
export 'angular2.dart';
export 'package:angular2/core.dart' hide forwardRef, resolveForwardRef, ForwardRefFn;
export 'package:angular2/profile.dart';
export 'package:angular2/lifecycle_hooks.dart';
export 'package:angular2/src/core/application_tokens.dart' hide APP_COMPONENT_REF_PROMISE, APP_ID_RANDOM_PROVIDER;
export 'package:angular2/src/core/render/dom/dom_tokens.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerGetters({'update': (o) => o.update, 'ngSubmit': (o) => o.ngSubmit})
..registerSetters({'rawClass': (o, v) => o.rawClass = v, 'initialClasses': (o, v) => o.initialClasses = v, 'ngForOf': (o, v) => o.ngForOf = v, 'ngForTemplate': (o, v) => o.ngForTemplate = v, 'ngIf': (o, v) => o.ngIf = v, 'rawStyle': (o, v) => o.rawStyle = v, 'ngSwitch': (o, v) => o.ngSwitch = v, 'ngSwitchWhen': (o, v) => o.ngSwitchWhen = v, 'name': (o, v) => o.name = v, 'model': (o, v) => o.model = v, 'form': (o, v) => o.form = v})
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
}
