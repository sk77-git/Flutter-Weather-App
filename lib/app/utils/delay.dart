

import 'dart:async';

import 'package:flutter/foundation.dart';

class Delay {
  final int seconds;

  Timer? _timer;
  Delay({this.seconds=2});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(seconds: seconds), action);
  }
}