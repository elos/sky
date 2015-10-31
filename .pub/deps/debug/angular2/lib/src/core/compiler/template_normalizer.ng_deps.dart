library angular2.src.core.compiler.template_normalizer.ng_deps.dart;

import 'template_normalizer.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'directive_metadata.dart' show CompileTypeMetadata, CompileDirectiveMetadata, CompileTemplateMetadata;
import 'directive_metadata.ng_deps.dart' as i0;
import 'package:angular2/src/core/facade/lang.dart' show isPresent, isBlank;
import 'package:angular2/src/core/facade/collection.dart' show ListWrapper;
import 'package:angular2/src/core/facade/exceptions.dart' show BaseException;
import 'package:angular2/src/core/facade/exceptions.ng_deps.dart' as i3;
import 'package:angular2/src/core/facade/async.dart' show Future, PromiseWrapper;
import 'package:angular2/src/core/facade/async.ng_deps.dart' as i4;
import 'package:angular2/src/core/compiler/xhr.dart' show XHR;
import 'package:angular2/src/core/compiler/xhr.ng_deps.dart' as i5;
import 'package:angular2/src/core/compiler/url_resolver.dart' show UrlResolver;
import 'package:angular2/src/core/compiler/url_resolver.ng_deps.dart' as i6;
import 'style_url_resolver.dart' show extractStyleUrls, isStyleUrlResolvable;
import 'style_url_resolver.ng_deps.dart' as i7;
import 'package:angular2/src/core/di.dart' show Injectable;
import 'package:angular2/src/core/di.ng_deps.dart' as i8;
import 'package:angular2/src/core/metadata/view.dart' show ViewEncapsulation;
import 'package:angular2/src/core/metadata/view.ng_deps.dart' as i9;
import 'html_ast.dart' show HtmlAstVisitor, HtmlElementAst, HtmlTextAst, HtmlAttrAst, HtmlAst, htmlVisitAll;
import 'html_ast.ng_deps.dart' as i10;
import 'html_parser.dart' show HtmlParser;
import 'html_parser.ng_deps.dart' as i11;
import 'template_preparser.dart' show preparseElement, PreparsedElement, PreparsedElementType;
import 'template_preparser.ng_deps.dart' as i12;
export 'template_normalizer.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(TemplateNormalizer, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [const [XHR], const [UrlResolver], const [HtmlParser]],
(XHR _xhr, UrlResolver _urlResolver, HtmlParser _domParser) => new TemplateNormalizer(_xhr, _urlResolver, _domParser))
)
;
i0.initReflector();
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
