library angular2.src.core.linker.pipe_resolver;

import "package:angular2/src/core/di.dart" show resolveForwardRef, Injectable;
import "package:angular2/src/core/facade/lang.dart"
    show Type, isPresent, stringify;
import "package:angular2/src/core/facade/collection.dart" show ListWrapper;
import "package:angular2/src/core/facade/exceptions.dart" show BaseException;
import "package:angular2/src/core/metadata.dart" show PipeMetadata;
import "package:angular2/src/core/reflection/reflection.dart" show reflector;

bool _isPipeMetadata(dynamic type) {
  return type is PipeMetadata;
}

/**
 * Resolve a `Type` for [PipeMetadata].
 *
 * This interface can be overridden by the application developer to create custom behavior.
 *
 * See [Compiler]
 */
@Injectable()
class PipeResolver {
  /**
   * Return [PipeMetadata] for a given `Type`.
   */
  PipeMetadata resolve(Type type) {
    var metas = reflector.annotations(resolveForwardRef(type));
    if (isPresent(metas)) {
      var annotation = ListWrapper.find(metas, _isPipeMetadata);
      if (isPresent(annotation)) {
        return annotation;
      }
    }
    throw new BaseException(
        '''No Pipe decorator found on ${ stringify ( type )}''');
  }
}
