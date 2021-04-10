import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String whatWeDo =
        '\nGoogle collaborates with university students who are passionate about growing developer communities.\n\nDeveloper Student Clubs powered by Google Developers is an initiative to help students to grow their knowledge on developer\ntechnologies and more through peer to peer workshops and events, and gain relevant industry experience.';
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 72.0,
        titleSpacing: 8,
        leading: Container(
            padding: EdgeInsets.only(left: 16, top: 4, bottom: 4),
            child: Image.asset(
              'assets/images/logo.png',
            )),
        title: Text('DSC KIET'),
      ),
      // drawer: Drawer,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 4),
            child: Lottie.asset('assets/images/splash_animation.json'),
          ),
          Text(
            'Devlopers Student Clubs KIET Group of Institutions',
          ),
          Padding(padding: EdgeInsets.only(top: 20)),
          Text.rich(TextSpan(
              text: 'powered by ',
              style: Theme.of(context).textTheme.bodyText2.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Color(0xff707070)),
              children: [
                TextSpan(
                  text: 'Google Developers',
                  style: Theme.of(context).textTheme.bodyText2.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff707070)),
                ),
              ])),
          Padding(padding: EdgeInsets.only(top: 10)),
          Padding(
            padding: const EdgeInsets.only(right: 128.0),
            child: ElevatedButton(
                onPressed: () {},
                child: Container(
                  child: Center(
                    child: Text('Become a member'),
                  ),
                )),
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          TextButton(
              onPressed: () {},
              child: Text(
                'Join Community Platform by Google Developers',
                style: Theme.of(context).textTheme.bodyText2.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0f9d58)),
              )),
          Padding(padding: EdgeInsets.only(top: 10)),
          Text(
            'What we do?',
          ),
          Text(
            whatWeDo,
            style: Theme.of(context).textTheme.bodyText2.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Color(0xff707070)),
          ),
          Padding(padding: EdgeInsets.only(top: 20)),
          Padding(
            padding: const EdgeInsets.only(right: 200.0),
            child: ElevatedButton(
                onPressed: () {},
                child: Container(
                  child: Center(
                    child: Text('SIGN UP'),
                  ),
                )),
          ),
          Padding(padding: EdgeInsets.only(top: 4)),
          TextButton(
              onPressed: () {},
              child: Text(
                'Learn more about the program',
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodyText2.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0f9d58)),
              )),
        ],
      ),
    );
  }
}
