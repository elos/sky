library angular2.src.transform.inliner_for_test.transformer.ng_deps.dart;

import 'transformer.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'dart:async';
import 'package:analyzer/analyzer.dart';
import 'package:analyzer/src/generated/ast.dart';
import 'package:angular2/src/core/compiler/xhr.dart' show XHR;
import 'package:angular2/src/core/compiler/xhr.ng_deps.dart' as i3;
import 'package:angular2/src/transform/common/annotation_matcher.dart';
import 'package:angular2/src/transform/common/annotation_matcher.ng_deps.dart' as i4;
import 'package:angular2/src/transform/common/asset_reader.dart';
import 'package:angular2/src/transform/common/asset_reader.ng_deps.dart' as i5;
import 'package:angular2/src/transform/common/naive_eval.dart';
import 'package:angular2/src/transform/common/naive_eval.ng_deps.dart' as i6;
import 'package:angular2/src/transform/common/async_string_writer.dart';
import 'package:angular2/src/transform/common/async_string_writer.ng_deps.dart' as i7;
import 'package:angular2/src/transform/common/logging.dart';
import 'package:angular2/src/transform/common/logging.ng_deps.dart' as i8;
import 'package:angular2/src/transform/common/options.dart';
import 'package:angular2/src/transform/common/options.ng_deps.dart' as i9;
import 'package:angular2/src/transform/common/url_resolver.dart';
import 'package:angular2/src/transform/common/url_resolver.ng_deps.dart' as i10;
import 'package:angular2/src/transform/common/xhr_impl.dart';
import 'package:angular2/src/transform/common/xhr_impl.ng_deps.dart' as i11;
import 'package:angular2/src/transform/directive_processor/inliner.dart';
import 'package:angular2/src/transform/directive_processor/inliner.ng_deps.dart' as i12;
import 'package:barback/barback.dart';
import 'package:dart_style/dart_style.dart';
export 'transformer.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i3.initReflector();
i4.initReflector();
i5.initReflector();
i6.initReflector();
i7.initReflector();
i8.initReflector();
i9.initReflector();
i10.initReflector();
i11.initReflector();
i12.initReflector();
}