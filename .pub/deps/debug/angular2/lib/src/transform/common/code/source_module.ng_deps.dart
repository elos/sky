library angular2.transform.common.code.source_module.ng_deps.dart;

import 'source_module.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:analyzer/src/generated/scanner.dart' show Keyword;
import 'package:angular2/src/core/compiler/source_module.dart';
import 'package:angular2/src/core/compiler/source_module.ng_deps.dart' as i1;
import 'uri.dart';
import 'uri.ng_deps.dart' as i2;
export 'source_module.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i1.initReflector();
i2.initReflector();
}
