import 'package:dsc_kiet_mobile_app/screens/splash_screen.dart';
import 'package:dsc_kiet_mobile_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DscApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage('assets/images/logo.png'), context);
    SystemChrome.setPreferredOrientations([
      // To Prevent the App from going in Lanscape Mode, We lock it in Potrait
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      // This Allows us to change the Naviagtion and Status Bar Color of Device
      statusBarColor: Colors.white, //top bar color
      statusBarIconBrightness: Brightness.light, //top bar icons
      systemNavigationBarColor: Colors.white, //bottom bar color
      systemNavigationBarIconBrightness: Brightness.dark, //bottom bar icons
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: SplashScreen(),
    );
  }
}
