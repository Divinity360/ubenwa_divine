import 'package:flutter/material.dart';
import 'package:ubenwa/screens/home/home.dart';

class AppRoutes {
  // homepage
  static const String home = '/home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return _getRoute(const HomeScreen());
      default:
        return _getRoute(const HomeScreen());
    }
  }

  static Route<dynamic> _getRoute(Widget screenName) =>
      MaterialPageRoute(builder: (_) => screenName);
}
