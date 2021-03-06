library angular2.src.web_workers.ui.event_dispatcher;

import "package:angular2/src/core/render/api.dart"
    show RenderViewRef, RenderEventDispatcher;
import "package:angular2/src/web_workers/shared/serializer.dart"
    show Serializer;
import "package:angular2/src/web_workers/ui/event_serializer.dart"
    show
        serializeMouseEvent,
        serializeKeyboardEvent,
        serializeGenericEvent,
        serializeEventWithTarget;
import "package:angular2/src/core/facade/exceptions.dart"
    show BaseException, WrappedException;
import "package:angular2/src/core/facade/collection.dart" show StringMapWrapper;
import "package:angular2/src/core/facade/async.dart"
    show EventEmitter, ObservableWrapper;

class EventDispatcher implements RenderEventDispatcher {
  RenderViewRef _viewRef;
  EventEmitter _sink;
  Serializer _serializer;
  EventDispatcher(this._viewRef, this._sink, this._serializer) {}
  bool dispatchRenderEvent(
      num elementIndex, String eventName, Map<String, dynamic> locals) {
    var e = locals["\$event"];
    var serializedEvent;
    // TODO (jteplitz602): support custom events #3350
    switch (e.type) {
      case "click":
      case "mouseup":
      case "mousedown":
      case "dblclick":
      case "contextmenu":
      case "mouseenter":
      case "mouseleave":
      case "mousemove":
      case "mouseout":
      case "mouseover":
      case "show":
        serializedEvent = serializeMouseEvent(e);
        break;
      case "keydown":
      case "keypress":
      case "keyup":
        serializedEvent = serializeKeyboardEvent(e);
        break;
      case "input":
      case "change":
      case "blur":
        serializedEvent = serializeEventWithTarget(e);
        break;
      case "abort":
      case "afterprint":
      case "beforeprint":
      case "cached":
      case "canplay":
      case "canplaythrough":
      case "chargingchange":
      case "chargingtimechange":
      case "close":
      case "dischargingtimechange":
      case "DOMContentLoaded":
      case "downloading":
      case "durationchange":
      case "emptied":
      case "ended":
      case "error":
      case "fullscreenchange":
      case "fullscreenerror":
      case "invalid":
      case "languagechange":
      case "levelfchange":
      case "loadeddata":
      case "loadedmetadata":
      case "obsolete":
      case "offline":
      case "online":
      case "open":
      case "orientatoinchange":
      case "pause":
      case "pointerlockchange":
      case "pointerlockerror":
      case "play":
      case "playing":
      case "ratechange":
      case "readystatechange":
      case "reset":
      case "scroll":
      case "seeked":
      case "seeking":
      case "stalled":
      case "submit":
      case "success":
      case "suspend":
      case "timeupdate":
      case "updateready":
      case "visibilitychange":
      case "volumechange":
      case "waiting":
        serializedEvent = serializeGenericEvent(e);
        break;
      default:
        throw new BaseException(eventName + " not supported on WebWorkers");
    }
    var serializedLocals = StringMapWrapper.create();
    StringMapWrapper.set(serializedLocals, "\$event", serializedEvent);
    ObservableWrapper.callNext(this._sink, {
      "viewRef": this._serializer.serialize(this._viewRef, RenderViewRef),
      "elementIndex": elementIndex,
      "eventName": eventName,
      "locals": serializedLocals
    });
    // TODO(kegluneq): Eventually, we want the user to indicate from the UI side whether the event

    // should be canceled, but for now just call `preventDefault` on the original DOM event.
    return false;
  }
}
