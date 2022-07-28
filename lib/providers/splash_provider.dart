import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ubenwa/main.dart';
import 'package:ubenwa/utils/routes.dart';

class SplashProvider extends ChangeNotifier {
  void processLoginRedirect() {
    Timer(
        const Duration(seconds: 1),
        () => Navigator.of(navigationKeyState.currentContext!)
            .pushReplacementNamed(AppRoutes.login));
  }
}
