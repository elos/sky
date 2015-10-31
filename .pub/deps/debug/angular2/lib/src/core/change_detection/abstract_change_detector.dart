library angular2.src.core.change_detection.abstract_change_detector;

import "package:angular2/src/core/facade/lang.dart"
    show isPresent, isBlank, StringWrapper;
import "package:angular2/src/core/facade/exceptions.dart" show BaseException;
import "package:angular2/src/core/facade/collection.dart" show ListWrapper;
import "change_detection_util.dart" show ChangeDetectionUtil;
import "change_detector_ref.dart" show ChangeDetectorRef, ChangeDetectorRef_;
import "directive_record.dart" show DirectiveIndex;
import "interfaces.dart" show ChangeDetector, ChangeDispatcher;
import "pipes.dart" show Pipes;
import "exceptions.dart"
    show
        ChangeDetectionError,
        ExpressionChangedAfterItHasBeenCheckedException,
        DehydratedException;
import "binding_record.dart" show BindingTarget;
import "parser/locals.dart" show Locals;
import "constants.dart" show ChangeDetectionStrategy;
import "../profile/profile.dart" show wtfCreateScope, wtfLeave, WtfScopeFn;
import "observable_facade.dart" show isObservable;

WtfScopeFn _scope_check =
    wtfCreateScope('''ChangeDetector#check(ascii id, bool throwOnChange)''');

class _Context {
  dynamic element;
  dynamic componentElement;
  dynamic context;
  dynamic locals;
  dynamic injector;
  dynamic expression;
  _Context(this.element, this.componentElement, this.context, this.locals,
      this.injector, this.expression) {}
}

class AbstractChangeDetector<T> implements ChangeDetector {
  String id;
  ChangeDispatcher dispatcher;
  num numberOfPropertyProtoRecords;
  List<BindingTarget> bindingTargets;
  List<DirectiveIndex> directiveIndices;
  ChangeDetectionStrategy strategy;
  List<dynamic> lightDomChildren = [];
  List<dynamic> shadowDomChildren = [];
  ChangeDetector parent;
  ChangeDetectorRef ref;
  // The names of the below fields must be kept in sync with codegen_name_util.ts or

  // change detection will fail.
  dynamic alreadyChecked = false;
  T context;
  Locals locals = null;
  ChangeDetectionStrategy mode = null;
  Pipes pipes = null;
  num propertyBindingIndex;
  // This is an experimental feature. Works only in Dart.
  List<dynamic> subscriptions;
  List<dynamic> streams;
  AbstractChangeDetector(
      this.id,
      this.dispatcher,
      this.numberOfPropertyProtoRecords,
      this.bindingTargets,
      this.directiveIndices,
      this.strategy) {
    this.ref = new ChangeDetectorRef_(this);
  }
  void addChild(ChangeDetector cd) {
    this.lightDomChildren.add(cd);
    cd.parent = this;
  }

  void removeChild(ChangeDetector cd) {
    ListWrapper.remove(this.lightDomChildren, cd);
  }

  void addShadowDomChild(ChangeDetector cd) {
    this.shadowDomChildren.add(cd);
    cd.parent = this;
  }

  void removeShadowDomChild(ChangeDetector cd) {
    ListWrapper.remove(this.shadowDomChildren, cd);
  }

  void remove() {
    this.parent.removeChild(this);
  }

  bool handleEvent(String eventName, num elIndex, Locals locals) {
    var res = this.handleEventInternal(eventName, elIndex, locals);
    this.markPathToRootAsCheckOnce();
    return res;
  }

  bool handleEventInternal(String eventName, num elIndex, Locals locals) {
    return false;
  }

  void detectChanges() {
    this.runDetectChanges(false);
  }

  void checkNoChanges() {
    throw new BaseException("Not implemented");
  }

  void runDetectChanges(bool throwOnChange) {
    if (identical(this.mode, ChangeDetectionStrategy.Detached) ||
        identical(this.mode, ChangeDetectionStrategy.Checked)) return;
    var s = _scope_check(this.id, throwOnChange);
    this.detectChangesInRecords(throwOnChange);
    this._detectChangesInLightDomChildren(throwOnChange);
    if (!throwOnChange) this.afterContentLifecycleCallbacks();
    this._detectChangesInShadowDomChildren(throwOnChange);
    if (!throwOnChange) this.afterViewLifecycleCallbacks();
    if (identical(this.mode, ChangeDetectionStrategy.CheckOnce)) this.mode =
        ChangeDetectionStrategy.Checked;
    this.alreadyChecked = true;
    wtfLeave(s);
  }
  // This method is not intended to be overridden. Subclasses should instead provide an

  // implementation of `detectChangesInRecordsInternal` which does the work of detecting changes

  // and which this method will call.

  // This method expects that `detectChangesInRecordsInternal` will set the property

  // `this.propertyBindingIndex` to the propertyBindingIndex of the first proto record. This is to

  // facilitate error reporting.
  void detectChangesInRecords(bool throwOnChange) {
    if (!this.hydrated()) {
      this.throwDehydratedError();
    }
    try {
      this.detectChangesInRecordsInternal(throwOnChange);
    } catch (e, e_stack) {
      this._throwError(e, e_stack);
    }
  }
  // Subclasses should override this method to perform any work necessary to detect and report

  // changes. For example, changes should be reported via `ChangeDetectionUtil.addChange`, lifecycle

  // methods should be called, etc.

  // This implementation should also set `this.propertyBindingIndex` to the propertyBindingIndex of

  // the

  // first proto record to facilitate error reporting. See [#detectChangesInRecords].
  void detectChangesInRecordsInternal(bool throwOnChange) {}
  // This method is not intended to be overridden. Subclasses should instead provide an

  // implementation of `hydrateDirectives`.
  void hydrate(T context, Locals locals, dynamic directives, dynamic pipes) {
    this.mode = ChangeDetectionUtil.changeDetectionMode(this.strategy);
    this.context = context;
    if (identical(this.strategy, ChangeDetectionStrategy.OnPushObserve)) {
      this.observeComponent(context);
    }
    this.locals = locals;
    this.pipes = pipes;
    this.hydrateDirectives(directives);
    this.alreadyChecked = false;
  }

  // Subclasses should override this method to hydrate any directives.
  void hydrateDirectives(dynamic directives) {}
  // This method is not intended to be overridden. Subclasses should instead provide an

  // implementation of `dehydrateDirectives`.
  void dehydrate() {
    this.dehydrateDirectives(true);
    // This is an experimental feature. Works only in Dart.
    if (identical(this.strategy, ChangeDetectionStrategy.OnPushObserve)) {
      this._unsubsribeFromObservables();
    }
    this.context = null;
    this.locals = null;
    this.pipes = null;
  }
  // Subclasses should override this method to dehydrate any directives. This method should reverse

  // any work done in `hydrateDirectives`.
  void dehydrateDirectives(bool destroyPipes) {}
  bool hydrated() {
    return !identical(this.context, null);
  }

  void afterContentLifecycleCallbacks() {
    this.dispatcher.notifyAfterContentChecked();
    this.afterContentLifecycleCallbacksInternal();
  }

  void afterContentLifecycleCallbacksInternal() {}
  void afterViewLifecycleCallbacks() {
    this.dispatcher.notifyAfterViewChecked();
    this.afterViewLifecycleCallbacksInternal();
  }

  void afterViewLifecycleCallbacksInternal() {}
  /** @internal */
  void _detectChangesInLightDomChildren(bool throwOnChange) {
    var c = this.lightDomChildren;
    for (var i = 0; i < c.length; ++i) {
      c[i].runDetectChanges(throwOnChange);
    }
  }

  /** @internal */
  void _detectChangesInShadowDomChildren(bool throwOnChange) {
    var c = this.shadowDomChildren;
    for (var i = 0; i < c.length; ++i) {
      c[i].runDetectChanges(throwOnChange);
    }
  }

  void markAsCheckOnce() {
    this.mode = ChangeDetectionStrategy.CheckOnce;
  }

  void markPathToRootAsCheckOnce() {
    ChangeDetector c = this;
    while (
        isPresent(c) && !identical(c.mode, ChangeDetectionStrategy.Detached)) {
      if (identical(c.mode, ChangeDetectionStrategy.Checked)) c.mode =
          ChangeDetectionStrategy.CheckOnce;
      c = c.parent;
    }
  }

  // This is an experimental feature. Works only in Dart.
  void _unsubsribeFromObservables() {
    if (isPresent(this.subscriptions)) {
      for (var i = 0; i < this.subscriptions.length; ++i) {
        var s = this.subscriptions[i];
        if (isPresent(this.subscriptions[i])) {
          s.cancel();
          this.subscriptions[i] = null;
        }
      }
    }
  }

  // This is an experimental feature. Works only in Dart.
  dynamic observeValue(dynamic value, num index) {
    if (isObservable(value)) {
      this._createArrayToStoreObservables();
      if (isBlank(this.subscriptions[index])) {
        this.streams[index] = value.changes;
        this.subscriptions[index] =
            value.changes.listen((_) => this.ref.markForCheck());
      } else if (!identical(this.streams[index], value.changes)) {
        this.subscriptions[index].cancel();
        this.streams[index] = value.changes;
        this.subscriptions[index] =
            value.changes.listen((_) => this.ref.markForCheck());
      }
    }
    return value;
  }

  // This is an experimental feature. Works only in Dart.
  dynamic observeDirective(dynamic value, num index) {
    if (isObservable(value)) {
      this._createArrayToStoreObservables();
      var arrayIndex = this.numberOfPropertyProtoRecords + index + 2;
      this.streams[arrayIndex] = value.changes;
      this.subscriptions[arrayIndex] =
          value.changes.listen((_) => this.ref.markForCheck());
    }
    return value;
  }

  // This is an experimental feature. Works only in Dart.
  dynamic observeComponent(dynamic value) {
    if (isObservable(value)) {
      this._createArrayToStoreObservables();
      var index = this.numberOfPropertyProtoRecords + 1;
      this.streams[index] = value.changes;
      this.subscriptions[index] =
          value.changes.listen((_) => this.ref.markForCheck());
    }
    return value;
  }

  void _createArrayToStoreObservables() {
    if (isBlank(this.subscriptions)) {
      this.subscriptions = ListWrapper.createFixedSize(
          this.numberOfPropertyProtoRecords + this.directiveIndices.length + 2);
      this.streams = ListWrapper.createFixedSize(
          this.numberOfPropertyProtoRecords + this.directiveIndices.length + 2);
    }
  }

  dynamic getDirectiveFor(dynamic directives, num index) {
    return directives.getDirectiveFor(this.directiveIndices[index]);
  }

  ChangeDetector getDetectorFor(dynamic directives, num index) {
    return directives.getDetectorFor(this.directiveIndices[index]);
  }

  void notifyDispatcher(dynamic value) {
    this.dispatcher.notifyOnBinding(this._currentBinding(), value);
  }

  void logBindingUpdate(dynamic value) {
    this.dispatcher.logBindingUpdate(this._currentBinding(), value);
  }

  Map<String, dynamic> addChange(
      Map<String, dynamic> changes, dynamic oldValue, dynamic newValue) {
    if (isBlank(changes)) {
      changes = {};
    }
    changes[this._currentBinding().name] =
        ChangeDetectionUtil.simpleChange(oldValue, newValue);
    return changes;
  }

  void _throwError(dynamic exception, dynamic stack) {
    var error;
    try {
      var c = this
          .dispatcher
          .getDebugContext(this._currentBinding().elementIndex, null);
      var context = isPresent(c)
          ? new _Context(c.element, c.componentElement, c.context, c.locals,
              c.injector, this._currentBinding().debug)
          : null;
      error = new ChangeDetectionError(
          this._currentBinding().debug, exception, stack, context);
    } catch (e, e_stack) {
      // if an error happens during getting the debug context, we throw a ChangeDetectionError

      // without the extra information.
      error = new ChangeDetectionError(null, exception, stack, null);
    }
    throw error;
  }

  void throwOnChangeError(dynamic oldValue, dynamic newValue) {
    throw new ExpressionChangedAfterItHasBeenCheckedException(
        this._currentBinding().debug, oldValue, newValue, null);
  }

  void throwDehydratedError() {
    throw new DehydratedException();
  }

  BindingTarget _currentBinding() {
    return this.bindingTargets[this.propertyBindingIndex];
  }
}
