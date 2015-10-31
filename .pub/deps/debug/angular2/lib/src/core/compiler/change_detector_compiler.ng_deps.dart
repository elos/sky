library angular2.src.core.compiler.change_detector_compiler.ng_deps.dart;

import 'change_detector_compiler.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'directive_metadata.dart' show CompileTypeMetadata;
import 'directive_metadata.ng_deps.dart' as i0;
import 'source_module.dart' show SourceExpressions, moduleRef;
import 'source_module.ng_deps.dart' as i1;
import 'package:angular2/src/core/change_detection/change_detection_jit_generator.dart' show ChangeDetectorJITGenerator;
import 'change_definition_factory.dart' show createChangeDetectorDefinitions;
import 'change_definition_factory.ng_deps.dart' as i3;
import 'package:angular2/src/core/facade/lang.dart' show isJsObject;
import 'package:angular2/src/core/change_detection/change_detection.dart' show ChangeDetectorGenConfig, ChangeDetectorDefinition, DynamicProtoChangeDetector, ChangeDetectionStrategy;
import 'package:angular2/src/core/change_detection/change_detection.ng_deps.dart' as i5;
import 'template_ast.dart' show TemplateAst;
import 'template_ast.ng_deps.dart' as i6;
import 'package:angular2/src/transform/template_compiler/change_detector_codegen.dart' show Codegen;
import 'package:angular2/src/transform/template_compiler/change_detector_codegen.ng_deps.dart' as i7;
import 'util.dart' show IS_DART, MODULE_SUFFIX;
import 'util.ng_deps.dart' as i8;
import 'package:angular2/src/core/di.dart' show Injectable;
import 'package:angular2/src/core/di.ng_deps.dart' as i9;
export 'change_detector_compiler.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(ChangeDetectionCompiler, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [const [ChangeDetectorGenConfig]],
(ChangeDetectorGenConfig _genConfig) => new ChangeDetectionCompiler(_genConfig))
)
;
i0.initReflector();
i1.initReflector();
i3.initReflector();
i5.initReflector();
i6.initReflector();
i7.initReflector();
i8.initReflector();
i9.initReflector();
}
