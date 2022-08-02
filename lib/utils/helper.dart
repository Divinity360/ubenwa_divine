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
}
