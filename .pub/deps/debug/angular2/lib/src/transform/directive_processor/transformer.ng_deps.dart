library angular2.transform.directive_processor.transformer.ng_deps.dart;

import 'transformer.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'dart:async';
import 'dart:convert';
import 'package:angular2/src/core/dom/html_adapter.dart';
import 'package:angular2/src/core/dom/html_adapter.ng_deps.dart' as i2;
import 'package:angular2/src/transform/common/asset_reader.dart';
import 'package:angular2/src/transform/common/asset_reader.ng_deps.dart' as i3;
import 'package:angular2/src/transform/common/logging.dart' as log;
import 'package:angular2/src/transform/common/logging.ng_deps.dart' as i4;
import 'package:angular2/src/transform/common/names.dart';
import 'package:angular2/src/transform/common/options.dart';
import 'package:angular2/src/transform/common/options.ng_deps.dart' as i6;
import 'package:barback/barback.dart';
import 'rewriter.dart';
import 'rewriter.ng_deps.dart' as i8;
export 'transformer.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i2.initReflector();
i3.initReflector();
i4.initReflector();
i6.initReflector();
i8.initReflector();
}
