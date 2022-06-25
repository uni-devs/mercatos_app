import 'dart:async';

import 'package:flutter/foundation.dart';

part 'debouncer.dart';

abstract class MercatosLogicFunctions {
  ///
  /// i.e for search bar to get more strings before send to server
  static void runDebouncer(VoidCallback action,
      {int duration_in_milliseconds = 300}) {
    final _Debouncer debouncer = _Debouncer(duration_in_milliseconds);

    debouncer.run(action);
  }
}
