library angular2.src.web_workers.ui.impl.ng_deps.dart;

import 'impl.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'di_bindings.dart' show createInjector;
import 'di_bindings.ng_deps.dart' as i0;
import 'package:angular2/src/web_workers/shared/message_bus.dart' show MessageBus, MessageBusSink;
import 'package:angular2/src/web_workers/shared/message_bus.ng_deps.dart' as i1;
import 'package:angular2/src/core/application_ref.dart' show createNgZone;
import 'package:angular2/src/core/application_ref.ng_deps.dart' as i2;
import 'package:angular2/src/core/di.dart' show Injectable;
import 'package:angular2/src/core/di.ng_deps.dart' as i3;
import 'package:angular2/src/core/dom/browser_adapter.dart' show BrowserDomAdapter;
import 'package:angular2/src/core/dom/browser_adapter.ng_deps.dart' as i4;
import 'package:angular2/src/core/profile/wtf_init.dart' show wtfInit;
import 'package:angular2/src/core/profile/wtf_init.ng_deps.dart' as i5;
import 'package:angular2/src/web_workers/ui/setup.dart' show WebWorkerSetup;
import 'package:angular2/src/web_workers/ui/setup.ng_deps.dart' as i6;
import 'package:angular2/src/web_workers/ui/renderer.dart' show MessageBasedRenderer;
import 'package:angular2/src/web_workers/ui/renderer.ng_deps.dart' as i7;
import 'package:angular2/src/web_workers/ui/xhr_impl.dart' show MessageBasedXHRImpl;
import 'package:angular2/src/web_workers/ui/xhr_impl.ng_deps.dart' as i8;
import 'package:angular2/src/web_workers/shared/client_message_broker.dart' show ClientMessageBrokerFactory, ClientMessageBroker;
import 'package:angular2/src/web_workers/shared/client_message_broker.ng_deps.dart' as i9;
import 'package:angular2/src/web_workers/shared/service_message_broker.dart' show ServiceMessageBrokerFactory, ServiceMessageBroker;
import 'package:angular2/src/web_workers/shared/service_message_broker.ng_deps.dart' as i10;
export 'impl.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(WebWorkerApplication, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [const [ClientMessageBrokerFactory], const [ServiceMessageBrokerFactory]],
(ClientMessageBrokerFactory _clientMessageBrokerFactory, ServiceMessageBrokerFactory _serviceMessageBrokerFactory) => new WebWorkerApplication(_clientMessageBrokerFactory, _serviceMessageBrokerFactory))
)
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
}
