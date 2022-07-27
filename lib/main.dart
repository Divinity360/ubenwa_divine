import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ubenwa/providers/auth_provider.dart';
import 'package:ubenwa/providers/splash_provider.dart';
import 'package:ubenwa/utils/routes.dart';
import 'package:ubenwa/utils/theme.dart';

GlobalKey<NavigatorState> navigationKeyState = GlobalKey<NavigatorState>();

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<SplashProvider>(
      create: (context) => SplashProvider(),
    ),
    ChangeNotifierProvider<AuthProvider>(
      create: (context) => AuthProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Ubenwa Test',
        theme: lightTheme,
        navigatorKey: navigationKeyState,
        onGenerateRoute: AppRoutes.generateRoute);
  }
}
