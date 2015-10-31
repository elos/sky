library angular2.transform.stylesheet_compiler.processor.ng_deps.dart;

import 'processor.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'dart:async';
import 'package:angular2/src/transform/common/asset_reader.dart';
import 'package:angular2/src/transform/common/asset_reader.ng_deps.dart' as i1;
import 'package:angular2/src/transform/common/code/source_module.dart';
import 'package:angular2/src/transform/common/code/source_module.ng_deps.dart' as i2;
import 'package:angular2/src/transform/common/logging.dart';
import 'package:angular2/src/transform/common/logging.ng_deps.dart' as i3;
import 'package:angular2/src/transform/common/names.dart';
import 'package:angular2/src/transform/common/ng_compiler.dart';
import 'package:angular2/src/transform/common/ng_compiler.ng_deps.dart' as i5;
import 'package:angular2/src/core/compiler/source_module.dart';
import 'package:angular2/src/core/compiler/source_module.ng_deps.dart' as i6;
import 'package:barback/barback.dart';
export 'processor.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i1.initReflector();
i2.initReflector();
i3.initReflector();
i5.initReflector();
i6.initReflector();
}
