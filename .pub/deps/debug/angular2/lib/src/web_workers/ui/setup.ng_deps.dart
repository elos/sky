library angular2.src.web_workers.ui.setup.ng_deps.dart;

import 'setup.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/web_workers/shared/messaging_api.dart' show SETUP_CHANNEL;
import 'package:angular2/src/core/facade/async.dart' show EventEmitter, ObservableWrapper;
import 'package:angular2/src/core/facade/async.ng_deps.dart' as i1;
import 'package:angular2/src/web_workers/shared/message_bus.dart' show MessageBus;
import 'package:angular2/src/web_workers/shared/message_bus.ng_deps.dart' as i2;
import 'package:angular2/src/core/compiler/anchor_based_app_root_url.dart' show AnchorBasedAppRootUrl;
import 'package:angular2/src/core/compiler/anchor_based_app_root_url.ng_deps.dart' as i3;
import 'package:angular2/src/core/facade/lang.dart' show StringWrapper;
import 'package:angular2/src/core/di.dart' show Injectable;
import 'package:angular2/src/core/di.ng_deps.dart' as i5;
export 'setup.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(WebWorkerSetup, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [const [MessageBus], const [AnchorBasedAppRootUrl]],
(MessageBus _bus, AnchorBasedAppRootUrl anchorBasedAppRootUrl) => new WebWorkerSetup(_bus, anchorBasedAppRootUrl))
)
;
i1.initReflector();
i2.initReflector();
i3.initReflector();
i5.initReflector();
}
