library angular2.src.core.render.view_factory;

import "package:angular2/src/core/facade/lang.dart" show isBlank, isPresent;
import "api.dart"
    show
        RenderEventDispatcher,
        RenderTemplateCmd,
        RenderCommandVisitor,
        RenderBeginElementCmd,
        RenderBeginComponentCmd,
        RenderNgContentCmd,
        RenderTextCmd,
        RenderEmbeddedTemplateCmd;
import "view.dart" show DefaultRenderView, DefaultRenderFragmentRef;

DefaultRenderView<dynamic> createRenderView(
    List<RenderTemplateCmd> fragmentCmds,
    dynamic inplaceElement,
    NodeFactory<dynamic> nodeFactory) {
  DefaultRenderView<dynamic> view;
  var eventDispatcher = (num boundElementIndex, String eventName,
          dynamic event) =>
      view.dispatchRenderEvent(boundElementIndex, eventName, event);
  var context = new BuildContext(eventDispatcher, nodeFactory, inplaceElement);
  context.build(fragmentCmds);
  List<DefaultRenderFragmentRef<dynamic>> fragments = [];
  for (var i = 0; i < context.fragments.length; i++) {
    fragments.add(new DefaultRenderFragmentRef(context.fragments[i]));
  }
  view = new DefaultRenderView<dynamic>(
      fragments,
      context.boundTextNodes,
      context.boundElements,
      context.nativeShadowRoots,
      context.globalEventAdders,
      context.rootContentInsertionPoints);
  return view;
}

abstract class NodeFactory<N> {
  List<RenderTemplateCmd> resolveComponentTemplate(num templateId);
  N createTemplateAnchor(List<String> attrNameAndValues);
  N createElement(String name, List<String> attrNameAndValues);
  N createRootContentInsertionPoint();
  mergeElement(N existing, List<String> attrNameAndValues);
  N createShadowRoot(N host, num templateId);
  N createText(String value);
  appendChild(N parent, N child);
  on(N element, String eventName, Function callback);
  Function globalOn(String target, String eventName, Function callback);
}

class BuildContext<N> {
  Function _eventDispatcher;
  NodeFactory<N> factory;
  N _inplaceElement;
  BuildContext(this._eventDispatcher, this.factory, this._inplaceElement) {
    this.isHost = isPresent((_inplaceElement));
  }
  List<RenderViewBuilder<N>> _builders = [];
  List<Function> globalEventAdders = [];
  List<N> boundElements = [];
  List<N> boundTextNodes = [];
  List<N> nativeShadowRoots = [];
  List<List<N>> fragments = [];
  List<N> rootContentInsertionPoints = [];
  num componentCount = 0;
  bool isHost;
  build(List<RenderTemplateCmd> fragmentCmds) {
    this.enqueueFragmentBuilder(null, fragmentCmds);
    this._build(this._builders[0]);
  }

  _build(RenderViewBuilder<N> builder) {
    this._builders = [];
    builder.build(this);
    var enqueuedBuilders = this._builders;
    for (var i = 0; i < enqueuedBuilders.length; i++) {
      this._build(enqueuedBuilders[i]);
    }
  }

  enqueueComponentBuilder(Component<N> component) {
    this.componentCount++;
    this._builders.add(new RenderViewBuilder<N>(component, null,
        this.factory.resolveComponentTemplate(component.cmd.templateId)));
  }

  enqueueFragmentBuilder(
      Component<N> parentComponent, List<RenderTemplateCmd> commands) {
    var rootNodes = [];
    this.fragments.add(rootNodes);
    this
        ._builders
        .add(new RenderViewBuilder<N>(parentComponent, rootNodes, commands));
  }

  N consumeInplaceElement() {
    var result = this._inplaceElement;
    this._inplaceElement = null;
    return result;
  }

  addEventListener(num boundElementIndex, String target, String eventName) {
    if (isPresent(target)) {
      var handler = createEventHandler(boundElementIndex,
          '''${ target}:${ eventName}''', this._eventDispatcher);
      this.globalEventAdders.add(
          createGlobalEventAdder(target, eventName, handler, this.factory));
    } else {
      var handler = createEventHandler(
          boundElementIndex, eventName, this._eventDispatcher);
      this
          .factory
          .on(this.boundElements[boundElementIndex], eventName, handler);
    }
  }
}

Function createEventHandler(
    num boundElementIndex, String eventName, Function eventDispatcher) {
  return ($event) => eventDispatcher(boundElementIndex, eventName, $event);
}

Function createGlobalEventAdder(String target, String eventName,
    Function eventHandler, NodeFactory<dynamic> nodeFactory) {
  return () => nodeFactory.globalOn(target, eventName, eventHandler);
}

class RenderViewBuilder<N> implements RenderCommandVisitor {
  Component<N> parentComponent;
  List<N> fragmentRootNodes;
  List<RenderTemplateCmd> commands;
  List<dynamic /* N | Component < N > */ > parentStack;
  RenderViewBuilder(
      this.parentComponent, this.fragmentRootNodes, this.commands) {
    var rootNodesParent =
        isPresent(fragmentRootNodes) ? null : parentComponent.shadowRoot;
    this.parentStack = [rootNodesParent];
  }
  build(BuildContext<N> context) {
    for (var i = 0; i < this.commands.length; i++) {
      this.commands[i].visit(this, context);
    }
  }

  dynamic /* N | Component < N > */ get parent {
    return this.parentStack[this.parentStack.length - 1];
  }

  dynamic visitText(RenderTextCmd cmd, BuildContext<N> context) {
    var text = context.factory.createText(cmd.value);
    this._addChild(text, cmd.ngContentIndex, context);
    if (cmd.isBound) {
      context.boundTextNodes.add(text);
    }
    return null;
  }

  dynamic visitNgContent(RenderNgContentCmd cmd, BuildContext<N> context) {
    if (isPresent(this.parentComponent)) {
      if (this.parentComponent.isRoot) {
        var insertionPoint = context.factory.createRootContentInsertionPoint();
        if (this.parent is Component) {
          context.factory.appendChild(
              ((this.parent as Component<N>)).shadowRoot, insertionPoint);
        } else {
          context.factory.appendChild((this.parent as N), insertionPoint);
        }
        context.rootContentInsertionPoints.add(insertionPoint);
      } else {
        var projectedNodes = this.parentComponent.project(cmd.index);
        for (var i = 0; i < projectedNodes.length; i++) {
          var node = projectedNodes[i];
          this._addChild(node, cmd.ngContentIndex, context);
        }
      }
    }
    return null;
  }

  dynamic visitBeginElement(
      RenderBeginElementCmd cmd, BuildContext<N> context) {
    this.parentStack.add(this._beginElement(cmd, context));
    return null;
  }

  dynamic visitEndElement(BuildContext<N> context) {
    this._endElement();
    return null;
  }

  dynamic visitBeginComponent(
      RenderBeginComponentCmd cmd, BuildContext<N> context) {
    var el = this._beginElement(cmd, context);
    var root = el;
    if (cmd.nativeShadow) {
      root = context.factory.createShadowRoot(el, cmd.templateId);
      context.nativeShadowRoots.add(root);
    }
    var isRoot = identical(context.componentCount, 0) && context.isHost;
    var component = new Component(el, root, cmd, isRoot);
    context.enqueueComponentBuilder(component);
    this.parentStack.add(component);
    return null;
  }

  dynamic visitEndComponent(BuildContext<N> context) {
    this._endElement();
    return null;
  }

  dynamic visitEmbeddedTemplate(
      RenderEmbeddedTemplateCmd cmd, BuildContext<N> context) {
    var el = context.factory.createTemplateAnchor(cmd.attrNameAndValues);
    this._addChild(el, cmd.ngContentIndex, context);
    context.boundElements.add(el);
    if (cmd.isMerged) {
      context.enqueueFragmentBuilder(this.parentComponent, cmd.children);
    }
    return null;
  }

  N _beginElement(RenderBeginElementCmd cmd, BuildContext<N> context) {
    N el = context.consumeInplaceElement();
    if (isPresent(el)) {
      context.factory.mergeElement(el, cmd.attrNameAndValues);
      this.fragmentRootNodes.add(el);
    } else {
      el = context.factory.createElement(cmd.name, cmd.attrNameAndValues);
      this._addChild(el, cmd.ngContentIndex, context);
    }
    if (cmd.isBound) {
      var boundElementIndex = context.boundElements.length;
      context.boundElements.add(el);
      for (var i = 0; i < cmd.eventTargetAndNames.length; i += 2) {
        var target = cmd.eventTargetAndNames[i];
        var eventName = cmd.eventTargetAndNames[i + 1];
        context.addEventListener(boundElementIndex, target, eventName);
      }
    }
    return el;
  }

  _endElement() {
    this.parentStack.removeLast();
  }

  _addChild(N node, num ngContentIndex, BuildContext<N> context) {
    var parent = this.parent;
    if (isPresent(parent)) {
      if (parent is Component) {
        parent.addContentNode(ngContentIndex, node, context);
      } else {
        context.factory.appendChild((parent as N), node);
      }
    } else {
      this.fragmentRootNodes.add(node);
    }
  }
}

class Component<N> {
  N hostElement;
  N shadowRoot;
  RenderBeginComponentCmd cmd;
  bool isRoot;
  List<List<N>> contentNodesByNgContentIndex = [];
  Component(this.hostElement, this.shadowRoot, this.cmd, this.isRoot) {}
  addContentNode(num ngContentIndex, N node, BuildContext<N> context) {
    if (isBlank(ngContentIndex)) {
      if (this.cmd.nativeShadow) {
        context.factory.appendChild(this.hostElement, node);
      }
    } else {
      while (this.contentNodesByNgContentIndex.length <= ngContentIndex) {
        this.contentNodesByNgContentIndex.add([]);
      }
      this.contentNodesByNgContentIndex[ngContentIndex].add(node);
    }
  }

  List<N> project(num ngContentIndex) {
    return ngContentIndex < this.contentNodesByNgContentIndex.length
        ? this.contentNodesByNgContentIndex[ngContentIndex]
        : [];
  }
}
