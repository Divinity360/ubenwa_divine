import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ubenwa/main.dart';

class AppHelpers {
  static const _chars = "abcdefghijklmnopqrstuvwxyz";

  static void toastMessage(String message) {
    ScaffoldMessenger.of(navigationKeyState.currentContext!)
        .showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  static String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(Random().nextInt(_chars.length))));
}
