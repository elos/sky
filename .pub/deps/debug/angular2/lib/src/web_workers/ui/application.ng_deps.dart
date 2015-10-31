library angular2.src.web_workers.ui.ng_deps.dart;

import 'application.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'dart:isolate';
import 'dart:async';
import 'dart:core';
import 'package:angular2/src/web_workers/shared/message_bus.dart' show MessageBus;
import 'package:angular2/src/web_workers/shared/message_bus.ng_deps.dart' as i3;
import 'package:angular2/src/web_workers/ui/impl.dart' show bootstrapUICommon, WebWorkerApplication;
import 'package:angular2/src/web_workers/ui/impl.ng_deps.dart' as i4;
import 'package:angular2/src/web_workers/shared/isolate_message_bus.dart';
import 'package:angular2/src/web_workers/shared/isolate_message_bus.ng_deps.dart' as i5;
export 'application.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i3.initReflector();
i4.initReflector();
i5.initReflector();
}
