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
              style: Theme.of(context).textTheme.bodyText2.copyWith(
                    fontSize: 18,
                    color: Color(0xff707070),
                    fontWeight: FontWeight.normal,
                  ),
            )
          ],
        ),
        Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Text.rich(
              TextSpan(
                  text: '© copyright 2020 DSC KIET - Developed by ',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(fontSize: 16, fontWeight: FontWeight.normal),
                  children: [
                    TextSpan(
                      text: 'DSC KIET',
                      style: Theme.of(context).textTheme.bodyText2.copyWith(
                            fontSize: 16,
                          ),
                    ),
                  ]),
            )),
        Padding(
            padding: EdgeInsets.only(
          top: 20,
        )),
      ],
    );
  }
}
