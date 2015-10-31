library angular2.core.ng_deps.dart;

import 'core.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/metadata.ng_deps.dart' as i0;
import 'package:angular2/src/core/util.ng_deps.dart' as i1;
import 'package:angular2/src/core/di.ng_deps.dart' as i2;
import 'package:angular2/src/core/pipes.ng_deps.dart' as i3;
import 'package:angular2/src/core/facade.ng_deps.dart' as i4;
import 'package:angular2/src/core/application_ref.ng_deps.dart' as i5;
import 'package:angular2/src/core/services.ng_deps.dart' as i6;
import 'package:angular2/src/core/linker.ng_deps.dart' as i7;
import 'package:angular2/src/core/lifecycle.ng_deps.dart' as i8;
import 'package:angular2/src/core/zone.ng_deps.dart' as i9;
import 'package:angular2/src/core/render.ng_deps.dart' as i10;
import 'package:angular2/src/core/directives.ng_deps.dart' as i11;
import 'package:angular2/src/core/forms.ng_deps.dart' as i12;
import 'package:angular2/src/core/debug.ng_deps.dart' as i13;
import 'package:angular2/src/core/change_detection.ng_deps.dart' as i14;
export 'core.dart';
export 'package:angular2/src/core/metadata.dart';
export 'package:angular2/src/core/util.dart';
export 'package:angular2/src/core/di.dart';
export 'package:angular2/src/core/pipes.dart';
export 'package:angular2/src/core/facade.dart';
export 'package:angular2/src/core/application_ref.dart' hide ApplicationRef_, PlatformRef_;
export 'package:angular2/src/core/services.dart';
export 'package:angular2/src/core/linker.dart';
export 'package:angular2/src/core/lifecycle.dart';
export 'package:angular2/src/core/zone.dart';
export 'package:angular2/src/core/render.dart';
export 'package:angular2/src/core/directives.dart';
export 'package:angular2/src/core/forms.dart';
export 'package:angular2/src/core/debug.dart';
export 'package:angular2/src/core/change_detection.dart';
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
i5.initReflector();
i6.initReflector();
i7.initReflector();
i8.initReflector();
i9.initReflector();
i10.initReflector();
i11.initReflector();
i12.initReflector();
i13.initReflector();
i14.initReflector();
}
