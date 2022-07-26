import 'dart:ui';

import 'package:flutter/cupertino.dart';

///Set of colors from figma
class AppColors {
  AppColors._();

  static Color karry = const Color(0xFFFFE5D6);
  static Color hummingBird = const Color(0xFFD3EAF8);
  static Color magnolia = const Color(0xFFFBF5FF);
  static Color appBackgroundColor = const Color(0xFFFFFBF8);
  static Color headerTextColor = const Color(0xFF333E63);
  static Color descTextColor = const Color(0xFFBDBBD1);
  static Color primaryTextColor = const Color(0xFF88869D);
  static Color primaryButtonColor = const Color(0xFFF9923A);

  /// Gradients
  static LinearGradient splashGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      AppColors.karry,
      AppColors.hummingBird,
    ],
  );
}
