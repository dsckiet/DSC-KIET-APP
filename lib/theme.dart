import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
  primaryColor: Colors.white,
  colorScheme: ColorScheme(
      secondary: Colors.black,
      onError: Colors.red,
      error: Colors.red,
      onBackground: Colors.white,
      background: Colors.white,
      brightness: Brightness.light,
      onPrimary: Colors.white,
      onSurface: Colors.white,
      onSecondary: Colors.black,
      surface: Color(0xfff1f1f1),
      primaryVariant: Colors.white,
      secondaryVariant: Colors.black,
      primary: Colors.white),
  fontFamily: 'Sen',
  scaffoldBackgroundColor: Colors.white,
  primaryIconTheme: IconThemeData(
    color: Color(0xffe50914),
  ),
  primaryTextTheme: TextTheme(
    headline6: TextStyle(
        color: Color(0xff424242), fontSize: 18, fontWeight: FontWeight.bold),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      visualDensity: VisualDensity(horizontal: -4, vertical: -3),
      enableFeedback: true,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
      foregroundColor: MaterialStateProperty.all<Color>(
        Color(0xff707070),
      ),
      textStyle: MaterialStateProperty.all<TextStyle>(
        TextStyle(
          fontSize: 16,
          fontFamily: 'Sen',
        ),
      ),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Sen')),
          backgroundColor:
              MaterialStateProperty.all<Color>(Color(0xff4285f4)))),
  textTheme: TextTheme(
    headline1: TextStyle(
        color: Color(0xff424242), fontSize: 32, fontWeight: FontWeight.bold),
    headline2: TextStyle(
        color: Color(0xff424242), fontSize: 26, fontWeight: FontWeight.bold),
    bodyText2: TextStyle(
        color: Color(0xff707070), fontSize: 18, fontWeight: FontWeight.normal),
    bodyText1: TextStyle(
      color: Color(0xff707070),
      fontSize: 17,
      fontWeight: FontWeight.normal,
      wordSpacing: 1.3,
      height: 1.4,
    ),
  ),
);
