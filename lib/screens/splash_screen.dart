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

//  AnimationController controller;

//   Animation<TimelineValue<Animprops>> animation;

//   @override
//   void initState() {
//     super.initState();

//     controller = AnimationController(
//       duration: const Duration(milliseconds: 2400),
//       vsync: this,
//     )..forward();

//     controller.addListener(() {
//       if (controller.status == AnimationStatus.completed) {
//         Navigator.pushReplacement(context, MaterialPageRoute(builder: ))
//       }
//     });

//     animation = TimelineTween<Animprops>()
//         .addScene(
//           begin: 0.milliseconds,
//           end: 1000.milliseconds,
//           curve: Curves.ease,
//         )
//         .animate(Animprops.opacity, tween: Tween(begin: 0.0, end: 1.0))
//         .addSubsequentScene(
//           delay: 25.milliseconds,
//           duration: 1200.milliseconds,
//           curve: Curves.ease,
//         )
//         .animate(Animprops.bottomPadding, tween: Tween(begin: 10.0, end: 240.0))
//         // .addSubsequentScene(
//         //   delay: 200.milliseconds,
//         //   duration: 800.milliseconds,
//         //   curve: Curves.ease,
//         // )
//         // .animate(Animprops.opacity, tween: Tween(begin: 1.0, end: 0.0))
//         .parent
//         .animatedBy(controller);
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }
