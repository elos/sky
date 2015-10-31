library angular2.src.core.directives.ng_style.ng_deps.dart;

import 'ng_style.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/lifecycle_hooks.dart' show DoCheck;
import 'package:angular2/lifecycle_hooks.ng_deps.dart' as i0;
import 'package:angular2/src/core/change_detection.dart' show KeyValueDiffer, KeyValueDiffers;
import 'package:angular2/src/core/change_detection.ng_deps.dart' as i1;
import 'package:angular2/src/core/linker.dart' show ElementRef;
import 'package:angular2/src/core/linker.ng_deps.dart' as i2;
import 'package:angular2/src/core/metadata.dart' show Directive;
import 'package:angular2/src/core/metadata.ng_deps.dart' as i3;
import 'package:angular2/src/core/render.dart' show Renderer;
import 'package:angular2/src/core/render.ng_deps.dart' as i4;
import 'package:angular2/src/core/facade/lang.dart' show isPresent, isBlank, print;
export 'ng_style.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(NgStyle, new _ngRef.ReflectionInfo(
const [const Directive(inputs: const ["rawStyle: ng-style"], selector: "[ng-style]")],
const [const [KeyValueDiffers], const [ElementRef], const [Renderer]],
(KeyValueDiffers _differs, ElementRef _ngEl, Renderer _renderer) => new NgStyle(_differs, _ngEl, _renderer),
const [DoCheck])
)
..registerSetters({'rawStyle': (o, v) => o.rawStyle = v})
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
}
