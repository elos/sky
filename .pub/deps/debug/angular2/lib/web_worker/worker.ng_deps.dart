library angular2.web_worker.worker.ng_deps.dart;

import 'worker.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import '../lifecycle_hooks.ng_deps.dart' as i0;
import '../src/core/metadata.ng_deps.dart' as i1;
import '../src/core/util.ng_deps.dart' as i2;
import '../src/core/di.ng_deps.dart' as i3;
import '../src/core/pipes.ng_deps.dart' as i4;
import '../src/core/facade.ng_deps.dart' as i5;
import '../src/core/application_ref.ng_deps.dart' as i6;
import '../src/core/services.ng_deps.dart' as i7;
import '../src/core/linker.ng_deps.dart' as i8;
import '../src/core/lifecycle.ng_deps.dart' as i9;
import '../src/core/zone.ng_deps.dart' as i10;
import '../src/core/render/render.ng_deps.dart' as i11;
import '../src/core/directives.ng_deps.dart' as i12;
import '../src/core/forms.ng_deps.dart' as i13;
import '../src/core/debug.ng_deps.dart' as i14;
import '../src/core/change_detection.ng_deps.dart' as i15;
import '../profile.ng_deps.dart' as i16;
import '../src/web_workers/worker/application.ng_deps.dart' as i17;
import '../src/web_workers/shared/client_message_broker.ng_deps.dart' as i18;
import '../src/web_workers/shared/service_message_broker.ng_deps.dart' as i19;
import '../src/web_workers/shared/serializer.ng_deps.dart' as i20;
export 'worker.dart';
export '../lifecycle_hooks.dart';
export '../src/core/metadata.dart';
export '../src/core/util.dart';
export '../src/core/di.dart';
export '../src/core/pipes.dart';
export '../src/core/facade.dart';
export '../src/core/application_ref.dart';
export '../src/core/services.dart';
export '../src/core/linker.dart';
export '../src/core/lifecycle.dart';
export '../src/core/zone.dart';
export '../src/core/render/render.dart' show RenderEventDispatcher, Renderer, RenderElementRef, RenderViewRef, RenderProtoViewRef, RenderFragmentRef, RenderViewWithFragments, RenderTemplateCmd, RenderCommandVisitor, RenderTextCmd, RenderNgContentCmd, RenderBeginElementCmd, RenderBeginComponentCmd, RenderEmbeddedTemplateCmd, RenderBeginCmd;
export '../src/core/directives.dart';
export '../src/core/forms.dart';
export '../src/core/debug.dart';
export '../src/core/change_detection.dart';
export '../profile.dart';
export '../src/web_workers/worker/application.dart';
export '../src/web_workers/shared/client_message_broker.dart' show ClientMessageBroker, ClientMessageBrokerFactory, FnArg, UiArguments;
export '../src/web_workers/shared/service_message_broker.dart' show ReceivedMessage, ServiceMessageBroker, ServiceMessageBrokerFactory;
export '../src/web_workers/shared/serializer.dart' show PRIMITIVE;
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerGetters({'update': (o) => o.update, 'ngSubmit': (o) => o.ngSubmit})
..registerSetters({'rawClass': (o, v) => o.rawClass = v, 'initialClasses': (o, v) => o.initialClasses = v, 'ngForOf': (o, v) => o.ngForOf = v, 'ngForTemplate': (o, v) => o.ngForTemplate = v, 'ngIf': (o, v) => o.ngIf = v, 'rawStyle': (o, v) => o.rawStyle = v, 'ngSwitch': (o, v) => o.ngSwitch = v, 'ngSwitchWhen': (o, v) => o.ngSwitchWhen = v, 'name': (o, v) => o.name = v, 'model': (o, v) => o.model = v, 'form': (o, v) => o.form = v})
;
i0.initReflector();
i1.initReflector();
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
i17.initReflector();
i18.initReflector();
i19.initReflector();
i20.initReflector();
}
