//colors
import 'package:flutter/material.dart';

const Color blue = Color(0xff4285f4);
const Color red = Color(0xffDB4437);
const Color green = Color(0xff0F9D58);
const Color yellow = Color(0xffF4B400);

//fontsizes
TextStyle heading(BuildContext context) =>
    Theme.of(context).textTheme.headline1;
TextStyle subHeading(BuildContext context) =>
    Theme.of(context).textTheme.headline2;
TextStyle body2(BuildContext context) => Theme.of(context).textTheme.bodyText2;
TextStyle body1(BuildContext context) => Theme.of(context).textTheme.bodyText1;

//padding
const smallPadding = Padding(padding: EdgeInsets.only(top: 20));
const largePadding = Padding(padding: EdgeInsets.only(top: 40));
