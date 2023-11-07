import 'package:flutter/material.dart';
import 'package:promodoro_app/core/utils/colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
      colorSchemeSeed: ColorPicker.seedColor,
      brightness: Brightness.light,
      // fontFamily: 'Pacifico',
      appBarTheme: const AppBarTheme(
        backgroundColor: ColorPicker.lightBackgroundColor,
      ),
      scaffoldBackgroundColor: ColorPicker.lightBackgroundColor);
  static final darkTheme = ThemeData(
      colorSchemeSeed: ColorPicker.seedColor,
      brightness: Brightness.dark,
      // fontFamily: 'Pacifico',
      appBarTheme: const AppBarTheme(
        backgroundColor: ColorPicker.darkBackgroundColor,
      ),
      scaffoldBackgroundColor: ColorPicker.darkBackgroundColor);
}
