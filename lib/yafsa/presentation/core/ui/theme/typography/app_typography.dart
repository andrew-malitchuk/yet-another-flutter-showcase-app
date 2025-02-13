import 'package:flutter/material.dart';

TextTheme byColor(
  ColorScheme palette,
) {
  return TextTheme(
    displayLarge: TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w800,
      color: palette.primary,
      fontSize: 48.0,
    ),
    displayMedium: TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w700,
      color: palette.primary,
      fontSize: 34.0,
    ),
    displaySmall: TextStyle(
      fontFamily: 'Rubik',
      fontWeight: FontWeight.w600,
      color: palette.onPrimary,
      fontSize: 24.0,
    ),
    headlineLarge: TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w900,
      color: palette.primary,
      fontSize: 30.0,
    ),
    headlineMedium: TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w700,
      color: palette.primary,
      fontSize: 22.0,
    ),
    headlineSmall: TextStyle(
      fontFamily: 'Rubik',
      fontWeight: FontWeight.w400,
      color: palette.onSurface,
      fontSize: 18.0,
    ),
    titleLarge: TextStyle(
      fontFamily: 'Rubik',
      fontWeight: FontWeight.w600,
      color: palette.secondary,
      fontSize: 20.0,
    ),
    titleMedium: TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w500,
      color: palette.secondary,
      fontSize: 16.0,
    ),
    titleSmall: TextStyle(
      fontFamily: 'Rubik',
      fontWeight: FontWeight.w400,
      color: palette.onSecondary,
      fontSize: 14.0,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'Rubik',
      fontWeight: FontWeight.w500,
      color: palette.onSurface,
      fontSize: 16.0,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w400,
      color: palette.onSurface,
      fontSize: 14.0,
    ),
    bodySmall: TextStyle(
      fontFamily: 'Rubik',
      fontWeight: FontWeight.w300,
      color: palette.onSurface,
      fontSize: 12.0,
    ),
    labelLarge: TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,
      color: palette.onSurface,
      fontSize: 14.0,
    ),
    labelMedium: TextStyle(
      fontFamily: 'Rubik',
      fontWeight: FontWeight.w500,
      color: palette.onSurface,
      fontSize: 12.0,
    ),
    labelSmall: TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w400,
      color: palette.onSurface,
      fontSize: 10.0,
    ),
  );
}
