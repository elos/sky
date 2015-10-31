library angular2.src.web_workers.worker.event_dispatcher.ng_deps.dart;

import 'event_dispatcher.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/di.dart' show Injectable;
import 'package:angular2/src/core/di.ng_deps.dart' as i0;
import 'package:angular2/src/core/facade/collection.dart' show Map, MapWrapper;
import 'package:angular2/src/core/render/api.dart' show RenderViewRef, RenderEventDispatcher;
import 'package:angular2/src/core/render/api.ng_deps.dart' as i2;
import 'package:angular2/src/web_workers/shared/serializer.dart' show Serializer;
import 'package:angular2/src/web_workers/shared/serializer.ng_deps.dart' as i3;
import 'package:angular2/src/web_workers/shared/messaging_api.dart' show EVENT_CHANNEL;
import 'package:angular2/src/web_workers/shared/message_bus.dart' show MessageBus;
import 'package:angular2/src/web_workers/shared/message_bus.ng_deps.dart' as i5;
import 'package:angular2/src/core/facade/async.dart' show EventEmitter, ObservableWrapper;
import 'package:angular2/src/core/facade/async.ng_deps.dart' as i6;
import 'event_deserializer.dart' show deserializeGenericEvent;
export 'event_dispatcher.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(WebWorkerEventDispatcher, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [const [MessageBus], const [Serializer]],
(MessageBus bus, Serializer _serializer) => new WebWorkerEventDispatcher(bus, _serializer))
)
;
i0.initReflector();
i2.initReflector();
i3.initReflector();
i5.initReflector();
i6.initReflector();
}
