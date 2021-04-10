import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
  primaryColor: Colors.white,
  accentColor: Colors.black,
  fontFamily: 'Sen',
  scaffoldBackgroundColor: Colors.white,
  primaryIconTheme: IconThemeData(
    color: Color(0xffe50914),
  ),
  primaryTextTheme: TextTheme(
    headline6: TextStyle(
        color: Color(0xff424242), fontSize: 18, fontWeight: FontWeight.bold),
  ),
  textTheme: TextTheme(
    bodyText2: TextStyle(color: Color(0xff424242), fontSize: 24),
    subtitle1: TextStyle(color: Colors.grey, fontSize: 14),
  ),
);
