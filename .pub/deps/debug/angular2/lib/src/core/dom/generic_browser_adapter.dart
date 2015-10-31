library angular2.src.core.dom.generic_browser_adapter;

import "package:angular2/src/core/facade/collection.dart"
    show ListWrapper, StringMapWrapper;
import "package:angular2/src/core/facade/lang.dart"
    show isPresent, isFunction, StringWrapper, Type;
import "dom_adapter.dart" show DomAdapter;
import "package:angular2/src/core/compiler/xhr_impl.dart" show XHRImpl;

/**
 * Provides DOM operations in any browser environment.
 */
abstract class GenericBrowserDomAdapter extends DomAdapter {
  String _animationPrefix = null;
  String _transitionEnd = null;
  GenericBrowserDomAdapter() : super() {
    /* super call moved to initializer */;
    try {
      var element = this.createElement("div", this.defaultDoc());
      if (isPresent(this.getStyle(element, "animationName"))) {
        this._animationPrefix = "";
      } else {
        var domPrefixes = ["Webkit", "Moz", "O", "ms"];
        for (var i = 0; i < domPrefixes.length; i++) {
          if (isPresent(
              this.getStyle(element, domPrefixes[i] + "AnimationName"))) {
            this._animationPrefix =
                "-" + StringWrapper.toLowerCase(domPrefixes[i]) + "-";
            break;
          }
        }
      }
      Map<String, String> transEndEventNames = {
        "WebkitTransition": "webkitTransitionEnd",
        "MozTransition": "transitionend",
        "OTransition": "oTransitionEnd otransitionend",
        "transition": "transitionend"
      };
      StringMapWrapper.forEach(transEndEventNames, (value, key) {
        if (isPresent(this.getStyle(element, key))) {
          this._transitionEnd = value;
        }
      });
    } catch (e, e_stack) {
      this._animationPrefix = null;
      this._transitionEnd = null;
    }
  }
  Type getXHR() {
    return XHRImpl;
  }

  List<dynamic> getDistributedNodes(dynamic el) {
    return ((el as dynamic)).getDistributedNodes();
  }

  resolveAndSetHref(dynamic el, String baseUrl, String href) {
    el.href = href == null ? baseUrl : baseUrl + "/../" + href;
  }

  List<dynamic> cssToRules(String css) {
    var style = this.createStyleElement(css);
    this.appendChild(this.defaultDoc().head, style);
    var rules = [];
    if (isPresent(style.sheet)) {
      // TODO(sorvell): Firefox throws when accessing the rules of a stylesheet

      // with an @import

      // https://bugzilla.mozilla.org/show_bug.cgi?id=625013
      try {
        var rawRules = ((style.sheet as dynamic)).cssRules;
        rules = ListWrapper.createFixedSize(rawRules.length);
        for (var i = 0; i < rawRules.length; i++) {
          rules[i] = rawRules[i];
        }
      } catch (e, e_stack) {}
    } else {}
    this.remove(style);
    return rules;
  }

  bool supportsDOMEvents() {
    return true;
  }

  bool supportsNativeShadowDOM() {
    return isFunction(((this.defaultDoc().body as dynamic)).createShadowRoot);
  }

  bool supportsUnprefixedCssAnimation() {
    return isPresent(this.defaultDoc().body.style) &&
        isPresent(this.defaultDoc().body.style.animationName);
  }

  String getAnimationPrefix() {
    return isPresent(this._animationPrefix) ? this._animationPrefix : "";
  }

  String getTransitionEnd() {
    return isPresent(this._transitionEnd) ? this._transitionEnd : "";
  }

  bool supportsAnimation() {
    return isPresent(this._animationPrefix) && isPresent(this._transitionEnd);
  }
}
