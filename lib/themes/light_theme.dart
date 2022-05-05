// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class LightTheme {
  static const Color _PRIMARY_COLOR = Color.fromRGBO(0, 51, 102, 1);
  static const Color _TEXT_COLOR = Color(0xFF565656);

  ThemeData lightThemeData() {
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: _lightAppbarTheme(),
      textTheme: _lightTextTheme(),

      // theme colors:
      scaffoldBackgroundColor: Colors.white,
      backgroundColor: Colors.white,
      brightness: Brightness.light,
      primaryColor: _PRIMARY_COLOR,
    );
  }

  TextTheme _lightTextTheme() {
    return const TextTheme(
      bodyText1: TextStyle(
        color: _TEXT_COLOR,
      ),
      bodyText2: TextStyle(
        color: _TEXT_COLOR,
      ),
    );
  }

  AppBarTheme _lightAppbarTheme() {
    return const AppBarTheme(
      foregroundColor: _TEXT_COLOR,
      elevation: 0,
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(
        color: Color(0xFF444444),
      ),
    );
  }
}
