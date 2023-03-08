import 'package:flutter/material.dart';

import '../core/utils/color_manager.dart';

abstract class CustomTheme {
  static const _inputDecorationTheme = InputDecorationTheme(
    filled: true,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.secondTextColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.mainTextColor),
    ),
  );

  static ThemeData lightTheme() => ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: AppColors.greyColor),
        primaryColor: AppColors.mainTextColor,
        inputDecorationTheme: _inputDecorationTheme,
      );
}
