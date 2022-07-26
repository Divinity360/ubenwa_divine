import 'package:flutter/material.dart';
import 'package:ubenwa/screens/splash/splashscreen.dart';
import 'package:ubenwa/utils/routes.dart';
import 'package:ubenwa/utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ubenwa Test',
      theme: lightTheme,
      onGenerateRoute: AppRoutes.generateRoute
    );
  }
}
