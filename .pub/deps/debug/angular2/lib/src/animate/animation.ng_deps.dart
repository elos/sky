library angular2.src.animate.animation.ng_deps.dart;

import 'animation.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/facade/lang.dart' show DateWrapper, StringWrapper, RegExpWrapper, NumberWrapper, isPresent;
import 'package:angular2/src/core/facade/math.dart' show Math;
import 'package:angular2/src/core/render/dom/util.dart' show camelCaseToDashCase;
import 'package:angular2/src/core/render/dom/util.ng_deps.dart' as i2;
import 'package:angular2/src/core/facade/collection.dart' show StringMapWrapper;
import 'package:angular2/src/core/dom/dom_adapter.dart' show DOM;
import 'package:angular2/src/core/dom/dom_adapter.ng_deps.dart' as i4;
import 'browser_details.dart' show BrowserDetails;
import 'browser_details.ng_deps.dart' as i5;
import 'css_animation_options.dart' show CssAnimationOptions;
export 'animation.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i2.initReflector();
i4.initReflector();
i5.initReflector();
}
