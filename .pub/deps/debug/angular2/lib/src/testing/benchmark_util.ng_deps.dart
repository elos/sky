library angular2.src.testing.benchmark_util.ng_deps.dart;

import 'benchmark_util.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/dom/browser_adapter.dart' show BrowserDomAdapter;
import 'package:angular2/src/core/dom/browser_adapter.ng_deps.dart' as i0;
import 'package:angular2/src/core/facade/browser.dart' show document, window;
import 'package:angular2/src/core/facade/lang.dart' show NumberWrapper, isBlank;
import 'package:angular2/src/core/facade/exceptions.dart' show BaseException, WrappedException;
import 'package:angular2/src/core/facade/exceptions.ng_deps.dart' as i3;
export 'benchmark_util.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i3.initReflector();
}
