library angular2.src.core.linker.template_commands;

import "package:angular2/src/core/facade/lang.dart"
    show Type, isPresent, isBlank;
import "package:angular2/src/core/render/render.dart"
    show
        RenderTemplateCmd,
        RenderCommandVisitor,
        RenderBeginElementCmd,
        RenderTextCmd,
        RenderNgContentCmd,
        RenderBeginComponentCmd,
        RenderEmbeddedTemplateCmd;

num _nextTemplateId = 0;
num nextTemplateId() {
  return _nextTemplateId++;
}

/**
 * A compiled host template.
 *
 * This is const as we are storing it as annotation
 * for the compiled component type.
 */
class CompiledHostTemplate {
  final Function _templateGetter;
  // Note: _templateGetter is a function so that CompiledHostTemplate can be

  // a const!
  const CompiledHostTemplate(this._templateGetter);
  CompiledTemplate getTemplate() {
    return this._templateGetter();
  }
}

/**
 * A compiled template.
 */
class CompiledTemplate {
  num id;
  Function _dataGetter;
  // Note: paramGetter is a function so that we can have cycles between templates!

  // paramGetter returns a tuple with:

  // - ChangeDetector factory function

  // - TemplateCmd[]

  // - styles
  CompiledTemplate(this.id, this._dataGetter) {}
  CompiledTemplateData getData(String appId) {
    var data = this._dataGetter(appId, this.id);
    return new CompiledTemplateData(data[0], data[1], data[2]);
  }
}

class CompiledTemplateData {
  Function changeDetectorFactory;
  List<TemplateCmd> commands;
  List<String> styles;
  CompiledTemplateData(this.changeDetectorFactory, this.commands, this.styles) {
  }
}

const EMPTY_ARR = const [];

abstract class TemplateCmd implements RenderTemplateCmd {
  dynamic visit(RenderCommandVisitor visitor, dynamic context);
}

class TextCmd implements TemplateCmd, RenderTextCmd {
  String value;
  bool isBound;
  num ngContentIndex;
  TextCmd(this.value, this.isBound, this.ngContentIndex) {}
  dynamic visit(RenderCommandVisitor visitor, dynamic context) {
    return visitor.visitText(this, context);
  }
}

TextCmd text(String value, bool isBound, num ngContentIndex) {
  return new TextCmd(value, isBound, ngContentIndex);
}

class NgContentCmd implements TemplateCmd, RenderNgContentCmd {
  num index;
  num ngContentIndex;
  bool isBound = false;
  NgContentCmd(this.index, this.ngContentIndex) {}
  dynamic visit(RenderCommandVisitor visitor, dynamic context) {
    return visitor.visitNgContent(this, context);
  }
}

NgContentCmd ngContent(num index, num ngContentIndex) {
  return new NgContentCmd(index, ngContentIndex);
}

abstract class IBeginElementCmd implements TemplateCmd, RenderBeginElementCmd {
  List<dynamic /* String | num */ > variableNameAndValues;
  List<String> eventTargetAndNames;
  List<Type> directives;
  dynamic visit(RenderCommandVisitor visitor, dynamic context);
}

class BeginElementCmd
    implements TemplateCmd, IBeginElementCmd, RenderBeginElementCmd {
  String name;
  List<String> attrNameAndValues;
  List<String> eventTargetAndNames;
  List<dynamic /* String | num */ > variableNameAndValues;
  List<Type> directives;
  bool isBound;
  num ngContentIndex;
  BeginElementCmd(
      this.name,
      this.attrNameAndValues,
      this.eventTargetAndNames,
      this.variableNameAndValues,
      this.directives,
      this.isBound,
      this.ngContentIndex) {}
  dynamic visit(RenderCommandVisitor visitor, dynamic context) {
    return visitor.visitBeginElement(this, context);
  }
}

BeginElementCmd beginElement(
    String name,
    List<String> attrNameAndValues,
    List<String> eventTargetAndNames,
    List<dynamic /* String | num */ > variableNameAndValues,
    List<Type> directives,
    bool isBound,
    num ngContentIndex) {
  return new BeginElementCmd(name, attrNameAndValues, eventTargetAndNames,
      variableNameAndValues, directives, isBound, ngContentIndex);
}

class EndElementCmd implements TemplateCmd {
  dynamic visit(RenderCommandVisitor visitor, dynamic context) {
    return visitor.visitEndElement(context);
  }
}

TemplateCmd endElement() {
  return new EndElementCmd();
}

class BeginComponentCmd
    implements TemplateCmd, IBeginElementCmd, RenderBeginComponentCmd {
  String name;
  List<String> attrNameAndValues;
  List<String> eventTargetAndNames;
  List<dynamic /* String | num */ > variableNameAndValues;
  List<Type> directives;
  bool nativeShadow;
  num ngContentIndex;
  CompiledTemplate template;
  bool isBound = true;
  num templateId;
  BeginComponentCmd(
      this.name,
      this.attrNameAndValues,
      this.eventTargetAndNames,
      this.variableNameAndValues,
      this.directives,
      this.nativeShadow,
      this.ngContentIndex,
      this.template) {
    this.templateId = template.id;
  }
  dynamic visit(RenderCommandVisitor visitor, dynamic context) {
    return visitor.visitBeginComponent(this, context);
  }
}

BeginComponentCmd beginComponent(
    String name,
    List<String> attrNameAnsValues,
    List<String> eventTargetAndNames,
    List<dynamic /* String | num */ > variableNameAndValues,
    List<Type> directives,
    bool nativeShadow,
    num ngContentIndex,
    CompiledTemplate template) {
  return new BeginComponentCmd(
      name,
      attrNameAnsValues,
      eventTargetAndNames,
      variableNameAndValues,
      directives,
      nativeShadow,
      ngContentIndex,
      template);
}

class EndComponentCmd implements TemplateCmd {
  dynamic visit(RenderCommandVisitor visitor, dynamic context) {
    return visitor.visitEndComponent(context);
  }
}

TemplateCmd endComponent() {
  return new EndComponentCmd();
}

class EmbeddedTemplateCmd
    implements TemplateCmd, IBeginElementCmd, RenderEmbeddedTemplateCmd {
  List<String> attrNameAndValues;
  List<String> variableNameAndValues;
  List<Type> directives;
  bool isMerged;
  num ngContentIndex;
  Function changeDetectorFactory;
  List<TemplateCmd> children;
  bool isBound = true;
  String name = null;
  List<String> eventTargetAndNames = EMPTY_ARR;
  EmbeddedTemplateCmd(
      this.attrNameAndValues,
      this.variableNameAndValues,
      this.directives,
      this.isMerged,
      this.ngContentIndex,
      this.changeDetectorFactory,
      this.children) {}
  dynamic visit(RenderCommandVisitor visitor, dynamic context) {
    return visitor.visitEmbeddedTemplate(this, context);
  }
}

EmbeddedTemplateCmd embeddedTemplate(
    List<String> attrNameAndValues,
    List<String> variableNameAndValues,
    List<Type> directives,
    bool isMerged,
    num ngContentIndex,
    Function changeDetectorFactory,
    List<TemplateCmd> children) {
  return new EmbeddedTemplateCmd(attrNameAndValues, variableNameAndValues,
      directives, isMerged, ngContentIndex, changeDetectorFactory, children);
}

abstract class CommandVisitor implements RenderCommandVisitor {
  dynamic visitText(TextCmd cmd, dynamic context);
  dynamic visitNgContent(NgContentCmd cmd, dynamic context);
  dynamic visitBeginElement(BeginElementCmd cmd, dynamic context);
  dynamic visitEndElement(dynamic context);
  dynamic visitBeginComponent(BeginComponentCmd cmd, dynamic context);
  dynamic visitEndComponent(dynamic context);
  dynamic visitEmbeddedTemplate(EmbeddedTemplateCmd cmd, dynamic context);
}

visitAllCommands(CommandVisitor visitor, List<TemplateCmd> cmds,
    [dynamic context = null]) {
  for (var i = 0; i < cmds.length; i++) {
    cmds[i].visit(visitor, context);
  }
}
