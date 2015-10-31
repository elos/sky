library angular2.web_worker.ui.ng_deps.dart;

import 'ui.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import '../src/core/facade.ng_deps.dart' as i0;
import '../src/core/zone.ng_deps.dart' as i1;
import '../src/web_workers/ui/application.ng_deps.dart' as i2;
import '../src/web_workers/shared/client_message_broker.ng_deps.dart' as i3;
import '../src/web_workers/shared/service_message_broker.ng_deps.dart' as i4;
import '../src/web_workers/shared/serializer.ng_deps.dart' as i5;
export 'ui.dart';
export '../src/core/facade.dart';
export '../src/core/zone.dart';
export '../src/web_workers/ui/application.dart';
export '../src/web_workers/shared/client_message_broker.dart' show ClientMessageBroker, ClientMessageBrokerFactory, FnArg, UiArguments;
export '../src/web_workers/shared/service_message_broker.dart' show ReceivedMessage, ServiceMessageBroker, ServiceMessageBrokerFactory;
export '../src/web_workers/shared/serializer.dart' show PRIMITIVE;
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
i5.initReflector();
}
