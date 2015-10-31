library angular2.src.core.life_cycle.life_cycle;

import "package:angular2/src/core/di.dart" show Injectable;
import "package:angular2/src/core/change_detection/change_detection.dart"
    show ChangeDetector;
import "package:angular2/src/core/zone/ng_zone.dart" show NgZone;
import "package:angular2/src/core/facade/lang.dart" show isPresent;
import "package:angular2/src/core/facade/exceptions.dart"
    show BaseException, WrappedException;
import "../profile/profile.dart" show wtfLeave, wtfCreateScope, WtfScopeFn;

/**
 * Provides access to explicitly trigger change detection in an application.
 *
 * By default, `Zone` triggers change detection in Angular on each virtual machine (VM) turn. When
 * testing, or in some
 * limited application use cases, a developer can also trigger change detection with the
 * `lifecycle.tick()` method.
 *
 * Each Angular application has a single `LifeCycle` instance.
 *
 * ### Example
 *
 * This is a contrived example, since the bootstrap automatically runs inside of the `Zone`, which
 * invokes
 * `lifecycle.tick()` on your behalf.
 *
 * ```javascript
 * bootstrap(MyApp).then((ref:ComponentRef) => {
 *   var lifeCycle = ref.injector.get(LifeCycle);
 *   var myApp = ref.instance;
 *
 *   ref.doSomething();
 *   lifecycle.tick();
 * });
 * ```
 */
abstract class LifeCycle {
  /**
   *  Invoke this method to explicitly process change detection and its side-effects.
   *
   *  In development mode, `tick()` also performs a second change detection cycle to ensure that no
   * further
   *  changes are detected. If additional changes are picked up during this second cycle, bindings
   * in
   * the app have
   *  side-effects that cannot be resolved in a single change detection pass. In this case, Angular
   * throws an error,
   *  since an Angular application can only have one change detection pass during which all change
   * detection must
   *  complete.
   *
   */
  tick();
}

@Injectable()
class LifeCycle_ extends LifeCycle {
  /** @internal */
  static WtfScopeFn _tickScope = wtfCreateScope("LifeCycle#tick()");
  /** @internal */
  List<ChangeDetector> _changeDetectors;
  /** @internal */
  bool _enforceNoNewChanges;
  /** @internal */
  bool _runningTick = false;
  LifeCycle_(
      [ChangeDetector changeDetector = null, bool enforceNoNewChanges = false])
      : super() {
    /* super call moved to initializer */;
    this._changeDetectors = [];
    if (isPresent(changeDetector)) {
      this._changeDetectors.add(changeDetector);
    }
    this._enforceNoNewChanges = enforceNoNewChanges;
  }
  registerWith(NgZone zone, [ChangeDetector changeDetector = null]) {
    if (isPresent(changeDetector)) {
      this._changeDetectors.add(changeDetector);
    }
    zone.overrideOnTurnDone(() => this.tick());
  }

  tick() {
    if (this._runningTick) {
      throw new BaseException("LifeCycle.tick is called recursively");
    }
    var s = LifeCycle_._tickScope();
    try {
      this._runningTick = true;
      this._changeDetectors.forEach((detector) => detector.detectChanges());
      if (this._enforceNoNewChanges) {
        this._changeDetectors.forEach((detector) => detector.checkNoChanges());
      }
    } finally {
      this._runningTick = false;
      wtfLeave(s);
    }
  }
}
