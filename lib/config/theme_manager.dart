import 'package:flutter/material.dart';

import '../core/utils/color_manager.dart';

abstract class CustomTheme {
  static const _inputDecorationTheme = InputDecorationTheme(
    filled: true,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.primaryColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.primaryColor),
    ),
  );

  static ThemeData lightTheme() => ThemeData(
        fontFamily: 'NotoSansArabic',
        appBarTheme: const AppBarTheme(backgroundColor: AppColors.greyColor),
        primaryColor: AppColors.mainTextColor,
        inputDecorationTheme: _inputDecorationTheme,
      );
}
