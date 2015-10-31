library angular2.transform.reflection_remover.remove_reflection_capabilities.ng_deps.dart;

import 'remove_reflection_capabilities.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'dart:async';
import 'package:analyzer/analyzer.dart';
import 'package:angular2/src/transform/common/asset_reader.dart';
import 'package:angular2/src/transform/common/asset_reader.ng_deps.dart' as i2;
import 'package:angular2/src/transform/common/mirror_mode.dart';
import 'package:barback/barback.dart';
import 'codegen.dart';
import 'codegen.ng_deps.dart' as i5;
import 'rewriter.dart';
import 'rewriter.ng_deps.dart' as i6;
export 'remove_reflection_capabilities.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i2.initReflector();
i5.initReflector();
i6.initReflector();
}
