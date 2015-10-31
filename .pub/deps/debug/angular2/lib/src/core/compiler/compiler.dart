library angular2.src.core.compiler.compiler;

import "runtime_compiler.dart" show RuntimeCompiler_;
export "template_compiler.dart" show TemplateCompiler;
export "directive_metadata.dart"
    show CompileDirectiveMetadata, CompileTypeMetadata, CompileTemplateMetadata;
export "source_module.dart" show SourceModule, SourceWithImports;
import "package:angular2/src/core/facade/lang.dart"
    show assertionsEnabled, Type;
import "package:angular2/src/core/di.dart" show provide, Provider;
import "package:angular2/src/core/compiler/template_parser.dart"
    show TemplateParser;
import "package:angular2/src/core/compiler/html_parser.dart" show HtmlParser;
import "package:angular2/src/core/compiler/template_normalizer.dart"
    show TemplateNormalizer;
import "package:angular2/src/core/compiler/runtime_metadata.dart"
    show RuntimeMetadataResolver;
import "package:angular2/src/core/compiler/change_detector_compiler.dart"
    show ChangeDetectionCompiler;
import "package:angular2/src/core/compiler/style_compiler.dart"
    show StyleCompiler;
import "package:angular2/src/core/compiler/command_compiler.dart"
    show CommandCompiler;
import "package:angular2/src/core/compiler/template_compiler.dart"
    show TemplateCompiler;
import "package:angular2/src/core/change_detection/change_detection.dart"
    show ChangeDetectorGenConfig;
import "package:angular2/src/core/linker/compiler.dart" show Compiler;
import "package:angular2/src/core/compiler/runtime_compiler.dart"
    show RuntimeCompiler;
import "package:angular2/src/core/compiler/schema/element_schema_registry.dart"
    show ElementSchemaRegistry;
import "package:angular2/src/core/compiler/schema/dom_element_schema_registry.dart"
    show DomElementSchemaRegistry;
import "package:angular2/src/core/compiler/url_resolver.dart" show UrlResolver;
import "package:angular2/src/core/compiler/app_root_url.dart" show AppRootUrl;
import "package:angular2/src/core/compiler/anchor_based_app_root_url.dart"
    show AnchorBasedAppRootUrl;
import "package:angular2/src/core/change_detection/change_detection.dart"
    show Parser, Lexer;

List<dynamic /* Type | Provider | List < dynamic > */ > compilerProviders() {
  return [
    Lexer,
    Parser,
    HtmlParser,
    TemplateParser,
    TemplateNormalizer,
    RuntimeMetadataResolver,
    StyleCompiler,
    CommandCompiler,
    ChangeDetectionCompiler,
    provide(ChangeDetectorGenConfig,
        useValue: new ChangeDetectorGenConfig(
            assertionsEnabled(), assertionsEnabled(), false, true)),
    TemplateCompiler,
    provide(RuntimeCompiler, useClass: RuntimeCompiler_),
    provide(Compiler, useExisting: RuntimeCompiler),
    DomElementSchemaRegistry,
    provide(ElementSchemaRegistry, useExisting: DomElementSchemaRegistry),
    AnchorBasedAppRootUrl,
    provide(AppRootUrl, useExisting: AnchorBasedAppRootUrl),
    UrlResolver
  ];
}
