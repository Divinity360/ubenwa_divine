import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ubenwa/main.dart';
import 'package:ubenwa/providers/splash_provider.dart';
import 'package:ubenwa/utils/colors.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  final _splashProvider = Provider.of<SplashProvider>(navigationKeyState.currentContext!);

  @override
  void initState() {
    _splashProvider.processLoginRedirect();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.splashGradient),
        child: Center(
          child: Text('Test App', style: _textTheme.headline1),
        ),
      ),
    );
  }
}
