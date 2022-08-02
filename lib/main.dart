import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ubenwa/providers/pet_provider.dart';
import 'package:ubenwa/utils/routes.dart';
import 'package:ubenwa/utils/theme.dart';

/// Global navigator state
GlobalKey<NavigatorState> navigationKeyState = GlobalKey<NavigatorState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<PetProvider>(
      create: (context) => PetProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Figozo Test',
        theme: lightTheme,
        navigatorKey: navigationKeyState,
        onGenerateRoute: AppRoutes.generateRoute);
  }
}
