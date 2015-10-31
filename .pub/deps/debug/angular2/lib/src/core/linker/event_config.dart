library angular2.src.core.linker.event_config;

import "package:angular2/src/core/facade/lang.dart" show StringWrapper;

const EVENT_TARGET_SEPARATOR = ":";

class EventConfig {
  String fieldName;
  String eventName;
  bool isLongForm;
  EventConfig(this.fieldName, this.eventName, this.isLongForm) {}
  static EventConfig parse(String eventConfig) {
    var fieldName = eventConfig, eventName = eventConfig, isLongForm = false;
    var separatorIdx = eventConfig.indexOf(EVENT_TARGET_SEPARATOR);
    if (separatorIdx > -1) {
      // long format: 'fieldName: eventName'
      fieldName = StringWrapper.substring(eventConfig, 0, separatorIdx).trim();
      eventName = StringWrapper.substring(eventConfig, separatorIdx + 1).trim();
      isLongForm = true;
    }
    return new EventConfig(fieldName, eventName, isLongForm);
  }

  String getFullName() {
    return this.isLongForm
        ? '''${ this . fieldName}${ EVENT_TARGET_SEPARATOR}${ this . eventName}'''
        : this.eventName;
  }
}
