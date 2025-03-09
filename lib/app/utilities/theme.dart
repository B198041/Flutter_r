import 'package:flutter/material.dart';

import 'colors.dart';

abstract class AppTheme {
  static get lightTheme => _lightTheme;

  static final _lightTheme = ThemeData(
    brightness: Brightness.dark,
    platform: TargetPlatform.android,
    fontFamily: 'Roboto',
    textTheme: _textTheme,
    applyElevationOverlayColor: true,

    // Colors
    scaffoldBackgroundColor: AppColors.black, // Black background
    primarySwatch: Colors.blue, // Blue as the primary swatch
    primaryColor: AppColors.blue, // Blue as the primary color
    shadowColor: AppColors.black54, // Black shadow
    disabledColor: AppColors.blueGrey, // Blue-grey for disabled elements
    hintColor: AppColors.blueGrey300, // Light blue-grey for hints
    dividerColor: AppColors.blueGrey700, // Blue-grey for dividers

    // Widget Theme
    primaryIconTheme: _primaryIconTheme,
    timePickerTheme: _timePickerTheme,
  );

  static final TextTheme _textTheme = TextTheme(
    displayLarge: TextStyle(
      color: AppColors.blueAccent,
      letterSpacing: 1.3,
      fontSize: 44,
      fontWeight: FontWeight.w600,
    ),
    displayMedium: TextStyle(
      color: AppColors.blueAccent,
      letterSpacing: 1.3,
      fontSize: 36,
      fontWeight: FontWeight.w600,
    ),
    displaySmall: TextStyle(
      color: AppColors.blue,
      letterSpacing: 1.3,
      fontSize: 32,
      fontWeight: FontWeight.w500,
    ),
    headlineMedium: TextStyle(
      color: AppColors.blue,
      letterSpacing: 1.3,
      fontSize: 28,
      fontWeight: FontWeight.w500,
    ),
    headlineSmall: TextStyle(
      color: AppColors.blueGrey300,
      letterSpacing: 1.3,
      fontSize: 24,
      fontWeight: FontWeight.w600,
    ),
    titleLarge: TextStyle(
      color: AppColors.blue,
      letterSpacing: 1.5,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: TextStyle(
      color: AppColors.blueGrey200,
      letterSpacing: 1.3,
      fontSize: 18,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      color: AppColors.blueGrey100,
      letterSpacing: 1.3,
      fontSize: 14,
      fontWeight: FontWeight.w300,
    ),
    titleMedium: TextStyle(
      color: AppColors.blueGrey200,
      letterSpacing: 1.3,
      fontSize: 18,
      fontWeight: FontWeight.w400,
    ),
    titleSmall: TextStyle(
      color: AppColors.blueGrey300,
      letterSpacing: 1.3,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      color: AppColors.blueGrey400,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.3,
      fontSize: 18,
    ),
    labelSmall: TextStyle(
      color: AppColors.blueGrey200,
      letterSpacing: 1.3,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    labelLarge: TextStyle(
      color: AppColors.black,
      letterSpacing: 1.5,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  );

  static final _primaryIconTheme = IconThemeData(
    color: AppColors.blueAccent,
    size: 24,
  );

  static final _accentIconTheme = IconThemeData(
    color: AppColors.blue,
    size: 24,
  );

  static final _timePickerTheme = TimePickerThemeData(
    backgroundColor: AppColors.black,
    helpTextStyle: _textTheme.titleLarge,
    dialTextColor: AppColors.blueAccent,
    hourMinuteTextColor: AppColors.blueGrey200,
    dayPeriodTextColor: AppColors.blueGrey300,
  );
}
