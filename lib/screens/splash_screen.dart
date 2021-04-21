import 'package:dsc_kiet_mobile_app/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';

// enum Animprops {
//   bottomPadding,
//   opacity,
// }

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final ImageProvider logo = AssetImage('assets/images/logo.png');

  gotoHome() async {
    await Future.delayed(3.seconds);
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

// AnimatedBuilder(
//               animation: controller,
//               builder: (context, child) {
//                 return Opacity(
//                   opacity: animation.value.get(Animprops.opacity),
//                   child: Padding(
//                     padding: EdgeInsets.only(
//                         bottom: animation.value.get(Animprops.bottomPadding)),
//                     child: Center(
//                       child: Text(
//                         'DSC KIET',
//                       ),
//                     ),
//                   ),
//                 );
//               }),
