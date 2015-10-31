library angular2.src.core.change_detection.proto_record;

import "binding_record.dart" show BindingRecord;
import "directive_record.dart" show DirectiveIndex;

enum RecordType {
  Self,
  Const,
  PrimitiveOp,
  PropertyRead,
  PropertyWrite,
  Local,
  InvokeMethod,
  InvokeClosure,
  KeyedRead,
  KeyedWrite,
  Pipe,
  Interpolate,
  SafeProperty,
  CollectionLiteral,
  SafeMethodInvoke,
  DirectiveLifecycle,
  Chain
}

class ProtoRecord {
  RecordType mode;
  String name;
  var funcOrValue;
  List<dynamic> args;
  List<dynamic> fixedArgs;
  num contextIndex;
  DirectiveIndex directiveIndex;
  num selfIndex;
  BindingRecord bindingRecord;
  bool lastInBinding;
  bool lastInDirective;
  bool argumentToPureFunction;
  bool referencedBySelf;
  num propertyBindingIndex;
  ProtoRecord(
      this.mode,
      this.name,
      this.funcOrValue,
      this.args,
      this.fixedArgs,
      this.contextIndex,
      this.directiveIndex,
      this.selfIndex,
      this.bindingRecord,
      this.lastInBinding,
      this.lastInDirective,
      this.argumentToPureFunction,
      this.referencedBySelf,
      this.propertyBindingIndex) {}
  bool isPureFunction() {
    return identical(this.mode, RecordType.Interpolate) ||
        identical(this.mode, RecordType.CollectionLiteral);
  }

  bool isUsedByOtherRecord() {
    return !this.lastInBinding || this.referencedBySelf;
  }

  bool shouldBeChecked() {
    return this.argumentToPureFunction ||
        this.lastInBinding ||
        this.isPureFunction() ||
        this.isPipeRecord();
  }

  bool isPipeRecord() {
    return identical(this.mode, RecordType.Pipe);
  }

  bool isLifeCycleRecord() {
    return identical(this.mode, RecordType.DirectiveLifecycle);
  }
}
