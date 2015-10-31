library angular2.src.web_workers.shared.generic_message_bus.ng_deps.dart;

import 'generic_message_bus.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'dart:async';
import 'package:angular2/src/core/facade/async.dart' show EventEmitter;
import 'package:angular2/src/core/facade/async.ng_deps.dart' as i1;
import 'package:angular2/src/web_workers/shared/message_bus.dart' show MessageBus, MessageBusSink, MessageBusSource;
import 'package:angular2/src/web_workers/shared/message_bus.ng_deps.dart' as i2;
import 'package:angular2/src/core/zone/ng_zone.dart';
import 'package:angular2/src/core/zone/ng_zone.ng_deps.dart' as i3;
import 'package:angular2/src/core/facade/lang.dart';
import 'package:angular2/src/core/facade/exceptions.dart';
import 'package:angular2/src/core/facade/exceptions.ng_deps.dart' as i5;
export 'generic_message_bus.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i1.initReflector();
i2.initReflector();
i3.initReflector();
i5.initReflector();
}
