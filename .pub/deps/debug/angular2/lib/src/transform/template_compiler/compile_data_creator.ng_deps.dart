library angular2.transform.template_compiler.compile_data_creator.ng_deps.dart;

import 'compile_data_creator.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'dart:async';
import 'dart:convert';
import 'package:angular2/src/core/compiler/directive_metadata.dart';
import 'package:angular2/src/core/compiler/directive_metadata.ng_deps.dart' as i2;
import 'package:angular2/src/core/compiler/template_compiler.dart';
import 'package:angular2/src/core/compiler/template_compiler.ng_deps.dart' as i3;
import 'package:angular2/src/transform/common/asset_reader.dart';
import 'package:angular2/src/transform/common/asset_reader.ng_deps.dart' as i4;
import 'package:angular2/src/transform/common/logging.dart';
import 'package:angular2/src/transform/common/logging.ng_deps.dart' as i5;
import 'package:angular2/src/transform/common/model/ng_deps_model.pb.dart';
import 'package:angular2/src/transform/common/model/ng_deps_model.pb.ng_deps.dart' as i6;
import 'package:angular2/src/transform/common/model/reflection_info_model.pb.dart';
import 'package:angular2/src/transform/common/model/reflection_info_model.pb.ng_deps.dart' as i7;
import 'package:angular2/src/transform/common/names.dart';
import 'package:angular2/src/transform/common/ng_meta.dart';
import 'package:angular2/src/transform/common/ng_meta.ng_deps.dart' as i9;
import 'package:angular2/src/transform/common/url_resolver.dart';
import 'package:angular2/src/transform/common/url_resolver.ng_deps.dart' as i10;
import 'package:barback/barback.dart';
export 'compile_data_creator.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i2.initReflector();
i3.initReflector();
i4.initReflector();
i5.initReflector();
i6.initReflector();
i7.initReflector();
i9.initReflector();
i10.initReflector();
}
