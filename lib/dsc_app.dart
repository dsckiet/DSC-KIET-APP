import 'package:dsc_kiet_mobile_app/screens/splash_screen.dart';
import 'package:dsc_kiet_mobile_app/theme.dart';
import 'package:flutter/material.dart';

class DscApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage('assets/images/logo.png'), context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: SplashScreen(),
    );
  }
}
