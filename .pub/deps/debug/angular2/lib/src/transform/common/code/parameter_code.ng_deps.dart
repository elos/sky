library angular2.transform.common.code.parameter_code.ng_deps.dart;

import 'parameter_code.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:analyzer/analyzer.dart';
import 'package:analyzer/src/generated/ast.dart';
import 'package:angular2/src/transform/common/logging.dart';
import 'package:angular2/src/transform/common/logging.ng_deps.dart' as i2;
import 'package:angular2/src/transform/common/model/parameter_model.pb.dart';
import 'package:angular2/src/transform/common/model/parameter_model.pb.ng_deps.dart' as i3;
import 'constify.dart';
import 'constify.ng_deps.dart' as i4;
export 'parameter_code.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i2.initReflector();
i3.initReflector();
i4.initReflector();
}
