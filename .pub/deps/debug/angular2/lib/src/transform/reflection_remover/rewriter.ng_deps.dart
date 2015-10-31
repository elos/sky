library angular2.transform.reflection_remover.rewriter.ng_deps.dart;

import 'rewriter.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:analyzer/src/generated/ast.dart';
import 'package:angular2/src/transform/common/logging.dart';
import 'package:angular2/src/transform/common/logging.ng_deps.dart' as i1;
import 'package:angular2/src/transform/common/mirror_mode.dart';
import 'package:angular2/src/transform/common/names.dart';
import 'package:path/path.dart' as path;
import 'ast_tester.dart';
import 'ast_tester.ng_deps.dart' as i5;
import 'codegen.dart';
import 'codegen.ng_deps.dart' as i6;
export 'rewriter.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i1.initReflector();
i5.initReflector();
i6.initReflector();
}
