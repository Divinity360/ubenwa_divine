import 'package:flutter/material.dart';
import 'package:ubenwa/utils/colors.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.splashGradient),
        child: Center(
          child: Text('Test App', style: textTheme.headline1),
        ),
      ),
    );
  }
}
