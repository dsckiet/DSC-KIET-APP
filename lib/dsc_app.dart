import 'package:dsc_kiet_mobile_app/screens/splash_screen.dart';
import 'package:dsc_kiet_mobile_app/theme.dart';
import 'package:flutter/material.dart';

class DscApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage('assets/images/logo.png'), context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.black,
        fontFamily: 'Sen',
        scaffoldBackgroundColor: Colors.white,
        primaryIconTheme: IconThemeData(
          color: Color(0xffe50914),
        ),
        primaryTextTheme: TextTheme(
          headline6: TextStyle(
              color: Color(0xff424242),
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                textStyle: MaterialStateProperty.all<TextStyle>(
                    TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xff4285f4)))),
        textTheme: TextTheme(
          bodyText2: TextStyle(
              color: Color(0xff424242),
              fontSize: 32,
              fontWeight: FontWeight.bold),
          subtitle1: TextStyle(color: Colors.grey, fontSize: 14),
        ),
      ),
      home: SplashScreen(),
    );
  }
}
