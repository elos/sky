library angular2.src.core.linker.proto_view_factory.ng_deps.dart;

import 'proto_view_factory.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/facade/collection.dart' show ListWrapper;
import 'package:angular2/src/core/facade/lang.dart' show isPresent, isBlank, Type, isArray, isNumber;
import 'package:angular2/src/core/render/api.dart' show RenderProtoViewRef;
import 'package:angular2/src/core/render/api.ng_deps.dart' as i2;
import 'package:angular2/src/core/di.dart' show Injectable, Provider, resolveForwardRef, Inject;
import 'package:angular2/src/core/di.ng_deps.dart' as i3;
import '../pipes/pipe_provider.dart' show PipeProvider;
import '../pipes/pipe_provider.ng_deps.dart' as i4;
import '../pipes/pipes.dart' show ProtoPipes;
import '../pipes/pipes.ng_deps.dart' as i5;
import 'view.dart' show AppProtoView, AppProtoViewMergeInfo, ViewType;
import 'view.ng_deps.dart' as i6;
import 'element_binder.dart' show ElementBinder;
import 'element_binder.ng_deps.dart' as i7;
import 'element_injector.dart' show ProtoElementInjector, DirectiveProvider;
import 'element_injector.ng_deps.dart' as i8;
import 'directive_resolver.dart' show DirectiveResolver;
import 'directive_resolver.ng_deps.dart' as i9;
import 'view_resolver.dart' show ViewResolver;
import 'view_resolver.ng_deps.dart' as i10;
import 'pipe_resolver.dart' show PipeResolver;
import 'pipe_resolver.ng_deps.dart' as i11;
import '../metadata/view.dart' show ViewMetadata;
import '../metadata/view.ng_deps.dart' as i12;
import 'package:angular2/src/core/pipes.dart' show DEFAULT_PIPES_TOKEN;
import 'package:angular2/src/core/pipes.ng_deps.dart' as i13;
import 'template_commands.dart' show visitAllCommands, CompiledTemplate, CompiledHostTemplate, TemplateCmd, CommandVisitor, EmbeddedTemplateCmd, BeginComponentCmd, BeginElementCmd, IBeginElementCmd, TextCmd, NgContentCmd;
import 'template_commands.ng_deps.dart' as i14;
import 'package:angular2/render.dart' show Renderer;
import 'package:angular2/render.ng_deps.dart' as i15;
import 'package:angular2/src/core/application_tokens.dart' show APP_ID;
import 'package:angular2/src/core/application_tokens.ng_deps.dart' as i16;
export 'proto_view_factory.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(ProtoViewFactory, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [const [Renderer], const [List, const Inject(DEFAULT_PIPES_TOKEN)], const [DirectiveResolver], const [ViewResolver], const [PipeResolver], const [String, const Inject(APP_ID)]],
(Renderer _renderer, List<Type> defaultPipes, DirectiveResolver _directiveResolver, ViewResolver _viewResolver, PipeResolver _pipeResolver, String appId) => new ProtoViewFactory(_renderer, defaultPipes, _directiveResolver, _viewResolver, _pipeResolver, appId))
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
i10.initReflector();
i11.initReflector();
i12.initReflector();
i13.initReflector();
i14.initReflector();
i15.initReflector();
i16.initReflector();
}
