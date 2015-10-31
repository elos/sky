library angular2.src.core.pipes.invalid_pipe_argument_exception;

import "package:angular2/src/core/facade/lang.dart" show Type;
import "package:angular2/src/core/facade/exceptions.dart"
    show BaseException, WrappedException;

class InvalidPipeArgumentException extends BaseException {
  InvalidPipeArgumentException(Type type, Object value)
      : super('''Invalid argument \'${ value}\' for pipe \'${ type}\'''') {
    /* super call moved to initializer */;
  }
}
