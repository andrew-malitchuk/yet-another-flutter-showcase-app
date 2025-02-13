import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Color(0xFFE3F4A7),
    scaffoldBackgroundColor: Color(0xFFFFFFFF),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFFE3F4A7),
      foregroundColor: Color(0xFF2F2D2E),
      elevation: 0,
    ),
    colorScheme: ColorScheme.light(
      primary: Color(0xFFE3F4A7),
      secondary: Color(0xFF5B4DFF),
      surface: Color(0xFF2F2D2E),
      error: Color(0xFFED5532),
      onPrimary: Color(0xFFF5F5F5),
      onSecondary: Color(0xFFFFFFFF),
      onSurface: Color(0xFFF5F5F5),
      onError: Color(0xFFFFFFFF),
    ));

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Color(0xFFE3F4A7),
  scaffoldBackgroundColor: Color(0xFF2F2D2E),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFF2F2D2E),
    foregroundColor: Color(0xFFF5F5F5),
    elevation: 0,
  ),
  colorScheme: ColorScheme.dark(
    primary: Color(0xFFE3F4A7),
    secondary: Color(0xFFEEA0FF),
    surface: Color(0xFFF5F5F5),
    error: Color(0xFFED5532),
    onPrimary: Color(0xFF2F2D2E),
    onSecondary: Color(0xFFFFFFFF),
    onSurface: Color(0xFF2F2D2E),
    onError: Color(0xFFFFFFFF),
  ),
);
