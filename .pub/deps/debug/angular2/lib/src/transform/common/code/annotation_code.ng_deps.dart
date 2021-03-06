library angular2.transform.common.code.annotation_code.ng_deps.dart;

import 'annotation_code.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:analyzer/analyzer.dart';
import 'package:analyzer/src/generated/ast.dart';
import 'package:angular2/src/transform/common/annotation_matcher.dart';
import 'package:angular2/src/transform/common/annotation_matcher.ng_deps.dart' as i2;
import 'package:angular2/src/transform/common/model/annotation_model.pb.dart';
import 'package:angular2/src/transform/common/model/annotation_model.pb.ng_deps.dart' as i3;
import 'package:barback/barback.dart' show AssetId;
import 'constify.dart' show constify;
import 'constify.ng_deps.dart' as i5;
export 'annotation_code.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i2.initReflector();
i3.initReflector();
i5.initReflector();
}
