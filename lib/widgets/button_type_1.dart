import 'package:dsckiet/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ButtonType1 extends StatelessWidget {
  const ButtonType1({
    Key key,
    this.icon,
    this.url,
  }) : super(key: key);

  final IconData icon;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10.0),
      child: PhysicalModel(
        color: Colors.transparent,
        elevation: 4,
        shape: BoxShape.circle,
        child: CircleAvatar(
          radius: 24,
          backgroundColor: Color(0xff222222),
          child: Material(
            type: MaterialType.circle,
            color: Colors.transparent,
            child: InkWell(
              highlightColor: red,
              borderRadius: BorderRadius.circular(24),
              onTap: () {
                launch(url);
              },
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 24,
                child: FaIcon(
                  icon,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
