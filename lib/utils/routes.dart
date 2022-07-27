import 'package:flutter/material.dart';
import 'package:ubenwa/screens/authentication/login.dart';
import 'package:ubenwa/screens/authentication/sign_up.dart';
import 'package:ubenwa/screens/splash/splashscreen.dart';

class AppRoutes {
  static const String splash = '/splash';

  // authentication
  static const String login = '/login';
  static const String signup = '/signup';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _getRoute(const Splashscreen());
      case login:
        return _getRoute(const LoginScreen());
      case signup:
        return _getRoute(const SignUpScreen());
      default:
        return _getRoute(const Splashscreen());
    }
  }

  static Route<dynamic> _getRoute(Widget screenName) =>
      MaterialPageRoute(builder: (_) => screenName);
}
