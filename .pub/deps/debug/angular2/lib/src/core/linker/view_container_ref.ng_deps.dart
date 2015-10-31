library angular2.src.core.linker.view_container_ref.ng_deps.dart;

import 'view_container_ref.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/facade/collection.dart' show ListWrapper;
import 'package:angular2/src/core/facade/exceptions.dart' show unimplemented;
import 'package:angular2/src/core/facade/exceptions.ng_deps.dart' as i1;
import 'package:angular2/src/core/di.dart' show ResolvedProvider;
import 'package:angular2/src/core/di.ng_deps.dart' as i2;
import 'package:angular2/src/core/facade/lang.dart' show isPresent, isBlank;
import 'view_manager.dart' as avmModule;
import 'view_manager.ng_deps.dart' as i4;
import 'view.dart' as viewModule;
import 'view.ng_deps.dart' as i5;
import 'element_ref.dart' show ElementRef, ElementRef_;
import 'element_ref.ng_deps.dart' as i6;
import 'template_ref.dart' show TemplateRef;
import 'template_ref.ng_deps.dart' as i7;
import 'view_ref.dart' show ViewRef, HostViewRef, ProtoViewRef, internalView;
import 'view_ref.ng_deps.dart' as i8;
export 'view_container_ref.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i1.initReflector();
i2.initReflector();
i4.initReflector();
i5.initReflector();
i6.initReflector();
i7.initReflector();
i8.initReflector();
}
