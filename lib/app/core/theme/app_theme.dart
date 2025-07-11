import 'package:flutter/material.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/consts/app_const_colors.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: AppConstColors.purple300,
      onPrimary: AppConstColors.white,
      onSecondary: AppConstColors.white,
      error: AppConstColors.red,
      onError: AppConstColors.white,
      surface: AppConstColors.white,
      onSurface: AppConstColors.black87,
      shadow: AppConstColors.black12,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: InputBorder.none,
      contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      hintStyle: TextStyle(color: AppConstColors.purple300),
      prefixIconColor: AppConstColors.purple300,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: AppConstColors.primaryPurple),
    textTheme: const TextTheme(bodyMedium: TextStyle(color: AppConstColors.black87)),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: AppConstColors.primaryPurple,
      onPrimary: AppConstColors.white,
      onSecondary: AppConstColors.white,
      error: AppConstColors.red,
      onError: AppConstColors.black,
      surface: Colors.grey.shade800,
      onSurface: AppConstColors.white,
      shadow: AppConstColors.black,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: InputBorder.none,
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      hintStyle: TextStyle(color: AppConstColors.white),
      prefixIconColor: AppConstColors.white,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Color(0xFFE6E6FA),
      foregroundColor: AppConstColors.black87,
    ),

    textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white70)),
  );
}
