import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    elevation: 0,
  ),
  primaryColor: Colors.white,
  primaryColorBrightness: Brightness.light,
  primaryColorDark: Colors.black,
  canvasColor: Colors.white,
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColorBrightness: Brightness.dark,
  primaryColor: Colors.grey.shade900,
  primaryColorLight: Colors.white,
  primaryColorDark: Colors.black,
  indicatorColor: Colors.white,
  canvasColor: Colors.grey.shade900,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey.shade900,
    foregroundColor: Colors.white,
    elevation: 0,
  ),
);
