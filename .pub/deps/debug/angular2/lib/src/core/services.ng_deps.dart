library angular2.src.core.services.ng_deps.dart;

import 'services.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/compiler/app_root_url.ng_deps.dart' as i0;
import 'package:angular2/src/core/compiler/url_resolver.ng_deps.dart' as i1;
import 'package:angular2/src/core/services/title.ng_deps.dart' as i2;
export 'services.dart';
export 'package:angular2/src/core/compiler/app_root_url.dart' show AppRootUrl;
export 'package:angular2/src/core/compiler/url_resolver.dart' show UrlResolver;
export 'package:angular2/src/core/services/title.dart' show Title;
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
}
