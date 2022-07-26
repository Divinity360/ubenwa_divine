import 'package:flutter/material.dart';
import 'package:ubenwa/utils/colors.dart';

/// Application themes styles

final ThemeData lightTheme = ThemeData.light().copyWith(
    backgroundColor: AppColors.appBackgroundColor,
    textTheme: TextTheme(
        headline1: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 30,
            color: AppColors.headerTextColor)));
