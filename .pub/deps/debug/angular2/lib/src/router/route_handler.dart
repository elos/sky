library angular2.src.router.route_handler;

import "package:angular2/src/core/facade/async.dart"
    show Future, PromiseWrapper;
import "package:angular2/src/core/facade/lang.dart" show Type;

abstract class RouteHandler {
  Type componentType;
  Future<dynamic> resolveComponentType();
  Map<String, dynamic> data;
}
