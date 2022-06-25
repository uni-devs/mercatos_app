import 'dart:async';

import 'package:flutter/foundation.dart';

/* 
  final Debouncer debouncer = Debouncer(300);

  // typing function
  
  _onTyping(String text) {
    debouncer.run(
      () async {
      
      },
    );
    setState(() {});
  }

 */
class Debouncer {
  final int milliseconds;
  Timer? _timer;

  Debouncer(this.milliseconds);

  run(VoidCallback action) {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
