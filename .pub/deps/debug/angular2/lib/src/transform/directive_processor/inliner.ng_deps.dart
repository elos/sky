library angular2.transform.directive_processor.inliner.ng_deps.dart;

import 'inliner.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'dart:async';
import 'package:analyzer/analyzer.dart';
import 'package:analyzer/src/generated/ast.dart';
import 'package:angular2/src/transform/common/async_string_writer.dart';
import 'package:angular2/src/transform/common/async_string_writer.ng_deps.dart' as i3;
import 'package:angular2/src/transform/common/logging.dart';
import 'package:angular2/src/transform/common/logging.ng_deps.dart' as i4;
import 'package:code_transformers/assets.dart';
import 'package:angular2/src/transform/common/asset_reader.dart';
import 'package:angular2/src/transform/common/asset_reader.ng_deps.dart' as i6;
import 'package:barback/barback.dart' show AssetId;
import 'package:source_span/source_span.dart';
import 'package:path/path.dart' as path;
export 'inliner.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i3.initReflector();
i4.initReflector();
i6.initReflector();
}
