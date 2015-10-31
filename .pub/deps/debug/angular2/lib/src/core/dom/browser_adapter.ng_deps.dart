library angular.core.facade.dom.ng_deps.dart;

import 'browser_adapter.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'dart:html';
import 'dom_adapter.dart' show setRootDomAdapter;
import 'dom_adapter.ng_deps.dart' as i1;
import 'generic_browser_adapter.dart' show GenericBrowserDomAdapter;
import 'generic_browser_adapter.ng_deps.dart' as i2;
import '../facade/browser.dart';
import 'dart:js' as js;
export 'browser_adapter.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i1.initReflector();
i2.initReflector();
}
