import 'package:dsckiet/constants.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.only(top: 20)),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 18,
            ),
            Padding(padding: EdgeInsets.only(right: 8)),
            Text(
              'Developer Student Clubs',
              style: body1(context).copyWith(fontSize: 18),
            )
          ],
        ),
        Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Text.rich(
              TextSpan(
                  text: '© copyright 2020 DSC KIET - Developed by ',
                  style: body1(context),
                  children: [
                    TextSpan(
                      text: 'DSC KIET',
                      style:
                          body1(context).copyWith(fontWeight: FontWeight.bold),
                    ),
                  ]),
            )),
        smallPadding,
      ],
    );
  }
}
