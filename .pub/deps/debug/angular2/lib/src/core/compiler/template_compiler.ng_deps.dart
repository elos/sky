library angular2.src.core.compiler.template_compiler.ng_deps.dart;

import 'template_compiler.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/facade/lang.dart' show Type, Json, isBlank, stringify;
import 'package:angular2/src/core/facade/exceptions.dart' show BaseException;
import 'package:angular2/src/core/facade/exceptions.ng_deps.dart' as i1;
import 'package:angular2/src/core/facade/collection.dart' show ListWrapper, SetWrapper;
import 'package:angular2/src/core/facade/async.dart' show PromiseWrapper, Future;
import 'package:angular2/src/core/facade/async.ng_deps.dart' as i3;
import 'package:angular2/src/core/linker/template_commands.dart' show CompiledTemplate, TemplateCmd, nextTemplateId, CompiledHostTemplate;
import 'package:angular2/src/core/linker/template_commands.ng_deps.dart' as i4;
import 'directive_metadata.dart' show createHostComponentMeta, CompileDirectiveMetadata, CompileTypeMetadata, CompileTemplateMetadata;
import 'directive_metadata.ng_deps.dart' as i5;
import 'template_ast.dart' show TemplateAst;
import 'template_ast.ng_deps.dart' as i6;
import 'package:angular2/src/core/di.dart' show Injectable;
import 'source_module.dart' show SourceModule, moduleRef;
import 'source_module.ng_deps.dart' as i8;
import 'change_detector_compiler.dart' show ChangeDetectionCompiler;
import 'change_detector_compiler.ng_deps.dart' as i9;
import 'style_compiler.dart' show StyleCompiler;
import 'style_compiler.ng_deps.dart' as i10;
import 'command_compiler.dart' show CommandCompiler;
import 'template_parser.dart' show TemplateParser;
import 'template_parser.ng_deps.dart' as i12;
import 'template_normalizer.dart' show TemplateNormalizer;
import 'template_normalizer.ng_deps.dart' as i13;
import 'runtime_metadata.dart' show RuntimeMetadataResolver;
import 'runtime_metadata.ng_deps.dart' as i14;
import 'package:angular2/src/core/application_tokens.dart' show APP_ID;
import 'package:angular2/src/core/application_tokens.ng_deps.dart' as i15;
import 'command_compiler.dart' show TEMPLATE_COMMANDS_MODULE_REF;
import 'command_compiler.ng_deps.dart' as i16;
import 'util.dart' show IS_DART, codeGenExportVariable, escapeSingleQuoteString, codeGenValueFn, MODULE_SUFFIX;
import 'util.ng_deps.dart' as i17;
import 'package:angular2/src/core/di.dart' show Inject;
import 'package:angular2/src/core/di.ng_deps.dart' as i18;
export 'template_compiler.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(TemplateCompiler, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [const [RuntimeMetadataResolver], const [TemplateNormalizer], const [TemplateParser], const [StyleCompiler], const [CommandCompiler], const [ChangeDetectionCompiler], const [String, const Inject(APP_ID)]],
(RuntimeMetadataResolver _runtimeMetadataResolver, TemplateNormalizer _templateNormalizer, TemplateParser _templateParser, StyleCompiler _styleCompiler, CommandCompiler _commandCompiler, ChangeDetectionCompiler _cdCompiler, String appId) => new TemplateCompiler(_runtimeMetadataResolver, _templateNormalizer, _templateParser, _styleCompiler, _commandCompiler, _cdCompiler, appId))
)
;
i1.initReflector();
i3.initReflector();
i4.initReflector();
i5.initReflector();
i6.initReflector();
i8.initReflector();
i9.initReflector();
i10.initReflector();
i12.initReflector();
i13.initReflector();
i14.initReflector();
i15.initReflector();
i16.initReflector();
i17.initReflector();
i18.initReflector();
}
