import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ubenwa/providers/auth_provider.dart';
import 'package:ubenwa/providers/newborn_provider.dart';
import 'package:ubenwa/providers/splash_provider.dart';
import 'package:ubenwa/services/background_service.dart';
import 'package:ubenwa/utils/routes.dart';
import 'package:ubenwa/utils/theme.dart';

/// Global navigator state
GlobalKey<NavigatorState> navigationKeyState = GlobalKey<NavigatorState>();

/// Top level background callback function
void callbackDispatcher() => BackgroundService.executeBackgroundTask();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BackgroundService.setupWorkManager(callbackDispatcher);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<SplashProvider>(
      create: (context) => SplashProvider(),
    ),
    ChangeNotifierProvider<AuthProvider>(
      create: (context) => AuthProvider(),
    ),
    ChangeNotifierProvider<NewBornProvider>(
      create: (context) => NewBornProvider(),
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
