library angular2.src.core.pipes.default_pipes;

import "async_pipe.dart" show AsyncPipe;
import "uppercase_pipe.dart" show UpperCasePipe;
import "lowercase_pipe.dart" show LowerCasePipe;
import "json_pipe.dart" show JsonPipe;
import "slice_pipe.dart" show SlicePipe;
import "date_pipe.dart" show DatePipe;
import "number_pipe.dart" show DecimalPipe, PercentPipe, CurrencyPipe;
import "package:angular2/src/core/di.dart" show Provider, OpaqueToken;

const DEFAULT_PIPES_LIST = const [
  AsyncPipe,
  UpperCasePipe,
  LowerCasePipe,
  JsonPipe,
  SlicePipe,
  DecimalPipe,
  PercentPipe,
  CurrencyPipe,
  DatePipe
];
const OpaqueToken DEFAULT_PIPES_TOKEN = const OpaqueToken("Default Pipes");
const Provider DEFAULT_PIPES =
    const Provider(DEFAULT_PIPES_TOKEN, useValue: DEFAULT_PIPES_LIST);
