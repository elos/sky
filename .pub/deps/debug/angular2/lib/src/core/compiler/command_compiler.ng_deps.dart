library angular2.src.core.compiler.command_compiler.ng_deps.dart;

import 'command_compiler.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/facade/lang.dart' show isPresent, isBlank, Type, isString, StringWrapper;
import 'package:angular2/src/core/facade/collection.dart' show SetWrapper, StringMapWrapper, ListWrapper;
import 'package:angular2/src/core/linker/template_commands.dart' show TemplateCmd, text, ngContent, beginElement, endElement, beginComponent, endComponent, embeddedTemplate, CompiledTemplate;
import 'package:angular2/src/core/linker/template_commands.ng_deps.dart' as i2;
import 'template_ast.dart' show TemplateAst, TemplateAstVisitor, NgContentAst, EmbeddedTemplateAst, ElementAst, VariableAst, BoundEventAst, BoundElementPropertyAst, AttrAst, BoundTextAst, TextAst, DirectiveAst, BoundDirectivePropertyAst, templateVisitAll;
import 'template_ast.ng_deps.dart' as i3;
import 'directive_metadata.dart' show CompileTypeMetadata, CompileDirectiveMetadata;
import 'directive_metadata.ng_deps.dart' as i4;
import 'source_module.dart' show SourceExpressions, SourceExpression, moduleRef;
import 'source_module.ng_deps.dart' as i5;
import 'package:angular2/src/core/metadata/view.dart' show ViewEncapsulation;
import 'package:angular2/src/core/metadata/view.ng_deps.dart' as i6;
import 'style_compiler.dart' show shimHostAttribute, shimContentAttribute, shimContentAttributeExpr, shimHostAttributeExpr;
import 'style_compiler.ng_deps.dart' as i7;
import 'util.dart' show escapeSingleQuoteString, MODULE_SUFFIX;
import 'util.ng_deps.dart' as i8;
import 'package:angular2/src/core/di.dart' show Injectable;
import 'package:angular2/src/core/di.ng_deps.dart' as i9;
export 'command_compiler.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(CommandCompiler, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [],
() => new CommandCompiler())
)
;
i2.initReflector();
i3.initReflector();
i4.initReflector();
i5.initReflector();
i6.initReflector();
i7.initReflector();
i8.initReflector();
i9.initReflector();
}
