import 'package:flutter/material.dart';

abstract final class AppColors {
  static const Color lightBlue = Color(0xFF187BCD);
  static const Color darkBlue = Color(0xFF03254C);
}

abstract final class AppTheme {
  static ThemeData get theme => _theme;
}

ThemeData get _theme => ThemeData(
      textTheme: textTheme,
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.darkBlue).copyWith(
        primary: AppColors.lightBlue,
        secondary: AppColors.darkBlue,
        onPrimary: AppColors.darkBlue,
        onSecondary: AppColors.lightBlue,
      ),
    );

const TextTheme textTheme = TextTheme(
  bodyLarge: regular,
  bodyMedium: regular,
  bodySmall: regular,
  titleLarge: bold,
  titleMedium: bold,
  titleSmall: bold,
  headlineLarge: bold,
  headlineMedium: bold,
  headlineSmall: bold,
);

const TextStyle regular = TextStyle(
  color: Colors.black,
  fontSize: 16,
  fontWeight: FontWeight.normal,
  fontFamily: 'GigaSans',
);

const TextStyle bold = TextStyle(
  color: Colors.black,
  fontSize: 32,
  fontWeight: FontWeight.bold,
  fontFamily: 'GigaSans',
);
