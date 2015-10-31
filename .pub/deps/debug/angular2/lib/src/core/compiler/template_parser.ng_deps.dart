library angular2.src.core.compiler.template_parser.ng_deps.dart;

import 'template_parser.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/facade/collection.dart' show MapWrapper, ListWrapper, StringMapWrapper, SetWrapper;
import 'package:angular2/src/core/facade/lang.dart' show RegExpWrapper, isPresent, StringWrapper, StringJoiner, stringify, assertionsEnabled, isBlank;
import 'package:angular2/src/core/di.dart' show Injectable;
import 'package:angular2/src/core/di.ng_deps.dart' as i2;
import 'package:angular2/src/core/facade/exceptions.dart' show BaseException;
import 'package:angular2/src/core/facade/exceptions.ng_deps.dart' as i3;
import 'package:angular2/src/core/change_detection/change_detection.dart' show Parser, AST, ASTWithSource;
import 'package:angular2/src/core/change_detection/change_detection.ng_deps.dart' as i4;
import 'package:angular2/src/core/change_detection/parser/ast.dart' show TemplateBinding;
import 'package:angular2/src/core/change_detection/parser/ast.ng_deps.dart' as i5;
import 'directive_metadata.dart' show CompileDirectiveMetadata;
import 'directive_metadata.ng_deps.dart' as i6;
import 'html_parser.dart' show HtmlParser;
import 'html_parser.ng_deps.dart' as i7;
import 'template_ast.dart' show ElementAst, BoundElementPropertyAst, BoundEventAst, VariableAst, TemplateAst, TextAst, BoundTextAst, EmbeddedTemplateAst, AttrAst, NgContentAst, PropertyBindingType, DirectiveAst, BoundDirectivePropertyAst;
import 'template_ast.ng_deps.dart' as i8;
import 'package:angular2/src/core/compiler/selector.dart' show CssSelector, SelectorMatcher;
import 'package:angular2/src/core/compiler/selector.ng_deps.dart' as i9;
import 'package:angular2/src/core/compiler/schema/element_schema_registry.dart' show ElementSchemaRegistry;
import 'template_preparser.dart' show preparseElement, PreparsedElement, PreparsedElementType;
import 'template_preparser.ng_deps.dart' as i11;
import 'style_url_resolver.dart' show isStyleUrlResolvable;
import 'style_url_resolver.ng_deps.dart' as i12;
import 'html_ast.dart' show HtmlAstVisitor, HtmlAst, HtmlElementAst, HtmlAttrAst, HtmlTextAst, htmlVisitAll;
import 'html_ast.ng_deps.dart' as i13;
import 'util.dart' show dashCaseToCamelCase, camelCaseToDashCase, splitAtColon;
import 'util.ng_deps.dart' as i14;
export 'template_parser.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(TemplateParser, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [const [Parser], const [ElementSchemaRegistry], const [HtmlParser]],
(Parser _exprParser, ElementSchemaRegistry _schemaRegistry, HtmlParser _htmlParser) => new TemplateParser(_exprParser, _schemaRegistry, _htmlParser))
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
i11.initReflector();
i12.initReflector();
i13.initReflector();
i14.initReflector();
}
