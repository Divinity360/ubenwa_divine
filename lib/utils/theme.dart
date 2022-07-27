import 'package:flutter/material.dart';
import 'package:ubenwa/utils/colors.dart';

/// Application themes styles

final ThemeData lightTheme = ThemeData.light().copyWith(
    backgroundColor: AppColors.appBackgroundColor,
    primaryColor: AppColors.primaryColor,
    textTheme: TextTheme(
        headline1: headlineTextStyle,
        headline2: headlineTextStyle.copyWith(fontSize: 22),
        subtitle1: subtitleTextStyle,
        subtitle2: subtitleHighlightTextStyle,
        bodyText2: bodyMediumTextStyle,
        headline3: headlineSmallTextStyle,
        headline4: headlineSmallHighlightTextStyle,
        button: primaryButtonTextStyle,
        bodyText1: boldLargeStyle));

final TextStyle headlineTextStyle = TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 30,
    color: AppColors.headerTextColor);

final TextStyle subtitleTextStyle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 10,
    color: AppColors.headerTextColor);

final TextStyle subtitleHighlightTextStyle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 11,
    decoration: TextDecoration.underline,
    color: AppColors.primaryColor);

final TextStyle bodyMediumTextStyle =
    TextStyle(fontWeight: FontWeight.w600, fontSize: 11, color: AppColors.grey);

final TextStyle headlineSmallTextStyle = TextStyle(
    fontWeight: FontWeight.w600, fontSize: 10, color: AppColors.blueHaze);

final TextStyle headlineSmallHighlightTextStyle = TextStyle(
  fontWeight: FontWeight.w600,
  fontSize: 10,
  color: AppColors.primaryColor,
  decoration: TextDecoration.underline
);

final TextStyle boldLargeStyle =
    TextStyle(fontWeight: FontWeight.w500, fontSize: 13, color: AppColors.grey);

final TextStyle primaryButtonTextStyle = TextStyle(
    fontWeight: FontWeight.w800, fontSize: 13, color: AppColors.white);
