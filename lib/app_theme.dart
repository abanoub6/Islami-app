import 'package:flutter/material.dart';

class AppTheme {
  static const Color lightPrimary = Color(0xffB7935F);
  static const Color darkPrimary = Color(0xff141A2E);
  static const Color black = Color(0xff242424);
  static const Color white = Color(0xffF8F8F8);
  static const Color gold = Color(0xffFACC1D);
  static ThemeData lightTheme = ThemeData(
    primaryColor: lightPrimary,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: lightPrimary,
      selectedItemColor: black,
      unselectedItemColor: white,
    ),
    scaffoldBackgroundColor: Colors.transparent,
  );
  static ThemeData darkTheme = ThemeData();
}
