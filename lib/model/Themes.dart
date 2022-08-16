import 'package:flutter/material.dart';
class themeApp {
  static Color primaryColorLight = Color(0xffB7935F);
  static Color primaryColorDark = Color(0xff141A2E);
  static Color fontLight = Colors.black;
  static Color fontDark = Colors.white;
  static Color colorDark = Color(0xffFACC1D);
  static ThemeData lightTheme = ThemeData(
      dividerColor: primaryColorLight,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: primaryColorLight,
          unselectedItemColor: fontDark,
          selectedItemColor: fontLight,
          showSelectedLabels: true,
          showUnselectedLabels: false),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: fontLight,
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
      ),
      textTheme: TextTheme(
          headline1: TextStyle(
            color: fontLight,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
          headline2: TextStyle(
            color: fontLight,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
          headline3: TextStyle(
            color: fontLight,
            fontWeight: FontWeight.w500,
            fontSize: 25,
          ),
          bodyText1: TextStyle(
            color: fontLight,
            fontWeight: FontWeight.w400,
            fontSize: 20,
          )));
  static ThemeData darkTheme = ThemeData(
      dividerColor: colorDark,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: primaryColorDark,
          unselectedItemColor: fontDark,
          selectedItemColor: colorDark,
          showSelectedLabels: true,
          showUnselectedLabels: false),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: fontDark,
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
      ),
      textTheme: TextTheme(
          headline1: TextStyle(
            color: fontDark,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
          headline2: TextStyle(
            color: fontDark,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
          headline3: TextStyle(
            color: fontDark,
            fontWeight: FontWeight.w500,
            fontSize: 25,
          ),
          bodyText1: TextStyle(
            color: colorDark,
            fontWeight: FontWeight.w400,
            fontSize: 20,
          )));
}
