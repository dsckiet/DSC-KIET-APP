import 'package:dsc_kiet_mobile_app/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final ImageProvider logo = AssetImage('assets/images/logo.png');

  gotoHome() async {
    await Future.delayed(2.seconds);
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Homescreen(),
        ));
  }

  @override
  void initState() {
    super.initState();
    gotoHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image(
              image: logo,
              height: 64,
            ),
          )
        ],
      ),
    );
  }
}
