library angular2.src.core.pipes.default_pipes.ng_deps.dart;

import 'default_pipes.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'async_pipe.dart' show AsyncPipe;
import 'async_pipe.ng_deps.dart' as i0;
import 'uppercase_pipe.dart' show UpperCasePipe;
import 'uppercase_pipe.ng_deps.dart' as i1;
import 'lowercase_pipe.dart' show LowerCasePipe;
import 'lowercase_pipe.ng_deps.dart' as i2;
import 'json_pipe.dart' show JsonPipe;
import 'json_pipe.ng_deps.dart' as i3;
import 'slice_pipe.dart' show SlicePipe;
import 'slice_pipe.ng_deps.dart' as i4;
import 'date_pipe.dart' show DatePipe;
import 'date_pipe.ng_deps.dart' as i5;
import 'number_pipe.dart' show DecimalPipe, PercentPipe, CurrencyPipe;
import 'number_pipe.ng_deps.dart' as i6;
import 'package:angular2/src/core/di.dart' show Provider, OpaqueToken;
import 'package:angular2/src/core/di.ng_deps.dart' as i7;
export 'default_pipes.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
i5.initReflector();
i6.initReflector();
i7.initReflector();
}
