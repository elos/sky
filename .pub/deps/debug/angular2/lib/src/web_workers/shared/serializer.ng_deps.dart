library angular2.src.web_workers.shared.serializer.ng_deps.dart;

import 'serializer.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/facade/lang.dart' show Type, isArray, isPresent, serializeEnum, deserializeEnum;
import 'package:angular2/src/core/facade/exceptions.dart' show BaseException, WrappedException;
import 'package:angular2/src/core/facade/exceptions.ng_deps.dart' as i1;
import 'package:angular2/src/core/facade/collection.dart' show Map, StringMapWrapper, MapWrapper;
import 'package:angular2/src/core/render/api.dart' show RenderProtoViewRef, RenderViewRef, RenderFragmentRef, RenderElementRef, RenderTemplateCmd, RenderCommandVisitor, RenderTextCmd, RenderNgContentCmd, RenderBeginElementCmd, RenderBeginComponentCmd, RenderEmbeddedTemplateCmd;
import 'package:angular2/src/core/render/api.ng_deps.dart' as i3;
import 'package:angular2/src/web_workers/shared/api.dart' show WebWorkerElementRef, WebWorkerTemplateCmd, WebWorkerTextCmd, WebWorkerNgContentCmd, WebWorkerBeginElementCmd, WebWorkerEndElementCmd, WebWorkerBeginComponentCmd, WebWorkerEndComponentCmd, WebWorkerEmbeddedTemplateCmd;
import 'package:angular2/src/web_workers/shared/api.ng_deps.dart' as i4;
import 'package:angular2/src/core/di.dart' show Injectable;
import 'package:angular2/src/core/di.ng_deps.dart' as i5;
import 'package:angular2/src/web_workers/shared/render_proto_view_ref_store.dart' show RenderProtoViewRefStore;
import 'package:angular2/src/web_workers/shared/render_proto_view_ref_store.ng_deps.dart' as i6;
import 'package:angular2/src/web_workers/shared/render_view_with_fragments_store.dart' show RenderViewWithFragmentsStore;
import 'package:angular2/src/web_workers/shared/render_view_with_fragments_store.ng_deps.dart' as i7;
export 'serializer.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(Serializer, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [const [RenderProtoViewRefStore], const [RenderViewWithFragmentsStore]],
(RenderProtoViewRefStore _protoViewStore, RenderViewWithFragmentsStore _renderViewStore) => new Serializer(_protoViewStore, _renderViewStore))
)
;
i1.initReflector();
i3.initReflector();
i4.initReflector();
i5.initReflector();
i6.initReflector();
i7.initReflector();
}
