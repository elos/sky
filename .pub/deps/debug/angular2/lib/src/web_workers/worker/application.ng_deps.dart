library angular2.src.web_workers.worker.ng_deps.dart;

import 'application.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/web_workers/shared/isolate_message_bus.dart';
import 'package:angular2/src/web_workers/shared/isolate_message_bus.ng_deps.dart' as i0;
import 'package:angular2/src/web_workers/worker/application_common.dart' show bootstrapWebWorkerCommon;
import 'package:angular2/src/web_workers/worker/application_common.ng_deps.dart' as i1;
import 'package:angular2/src/core/facade/async.dart' show Future;
import 'package:angular2/src/core/facade/async.ng_deps.dart' as i2;
import 'package:angular2/src/core/facade/lang.dart' show Type, BaseException;
import 'package:angular2/src/core/linker/dynamic_component_loader.dart' show ComponentRef;
import 'package:angular2/src/core/linker/dynamic_component_loader.ng_deps.dart' as i4;
import 'dart:isolate';
import 'dart:async';
import 'dart:core';
import 'package:angular2/src/core/dom/webworker_adapter.dart';
import 'package:angular2/src/core/dom/webworker_adapter.ng_deps.dart' as i8;
export 'application.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i4.initReflector();
i8.initReflector();
}
