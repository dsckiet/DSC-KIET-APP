import 'package:dsckiet/screens/splash_screen.dart';
import 'package:dsckiet/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dsckiet/services/firebase_messaging.dart';

class DscApp extends StatefulWidget {
  @override
  _DscAppState createState() => _DscAppState();
}

class _DscAppState extends State<DscApp> {
  final FirebaseNotifications _notifications = FirebaseNotifications();

  static const MethodChannel _channel =
      MethodChannel('notification_channel_dsc');

  Map<String, String> channelMap = {
    "id": "events_notification_channel",
    "name": "events notification",
    "description": "Notifications related to events conducted by dsc kiet",
  };

  createNotificationChannel() async {
    try {
      await _channel.invokeMethod('createNotificationChannel', channelMap);
    } on PlatformException catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _notifications.subscribeTonotifications();
    createNotificationChannel();
  }

  @override
  Widget build(BuildContext context) {
    precacheAllImages(context);

    SystemChrome.setPreferredOrientations([
      // To Prevent the App from going in Lanscape Mode, We lock it in Potrait
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      // This Allows us to change the Naviagtion and Status Bar Color of Device
      statusBarColor: Color(0xff4285f4), //top bar color
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

  void precacheAllImages(BuildContext context) {
    precacheImage(AssetImage('assets/images/logo.png'), context);
    precacheImage(AssetImage('assets/images/team.png'), context);
    precacheImage(AssetImage('assets/images/aakanksha_shivani.JPG'), context);
    precacheImage(AssetImage('assets/images/Aayush_Sharma.jpg'), context);
    precacheImage(AssetImage('assets/images/aditya_pandey.jpg'), context);
    precacheImage(AssetImage('assets/images/Aniket_Padmansh.jpg'), context);
    precacheImage(AssetImage('assets/images/anshul_gupta.jpg'), context);
    precacheImage(AssetImage('assets/images/ishita_jaiswal.jpg'), context);
    precacheImage(AssetImage('assets/images/Lakshay_Kumar.jpg'), context);
    precacheImage(AssetImage('assets/images/mayank_shakya.jpg'), context);
    precacheImage(AssetImage('assets/images/Nidhaan_Srivastava.jpg'), context);
    precacheImage(AssetImage('assets/images/priyanshu_sharma.jpg'), context);
    precacheImage(AssetImage('assets/images/ritik_srivastava.jpeg'), context);
    precacheImage(AssetImage('assets/images/rohan_mehta.jpg'), context);
    precacheImage(AssetImage('assets/images/satyam_sharma.jpg'), context);
    precacheImage(AssetImage('assets/images/shashank_jaitly.jpg'), context);
    precacheImage(AssetImage('assets/images/shubham_singh.jpg'), context);
    precacheImage(AssetImage('assets/images/vidit_jha.jpg'), context);
    precacheImage(AssetImage('assets/images/aakash_goel.jpg'), context);
    precacheImage(AssetImage('assets/images/ritwick_bhargav.jpeg'), context);
    precacheImage(AssetImage('assets/images/shubham_goswami.jpg'), context);
    precacheImage(AssetImage('assets/images/ritwick_bhargav.jpeg'), context);
    precacheImage(AssetImage('assets/images/shreeyanshi_gupta.jpeg'), context);
  }
}
