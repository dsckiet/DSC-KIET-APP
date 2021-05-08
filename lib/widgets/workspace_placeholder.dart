import 'package:dsckiet/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class WorkspacePlaceholder extends StatelessWidget {
  const WorkspacePlaceholder({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return PhysicalModel(
      color: Colors.transparent,
      elevation: 4,
      child: Container(
        padding: EdgeInsets.all(size.height / 32),
        decoration: BoxDecoration(
          color: Color(0xffDB4437),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 12.0),
              child: Text(
                'Join the workspace',
                style: subHeading(context).copyWith(color: Colors.white),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Text.rich(
                TextSpan(
                  text:
                      'Join our Discord and Telegram Channels to get instant updates about our ',
                  children: [
                    TextSpan(
                        text: '#activities, #sessions ',
                        style: body1(context).copyWith(
                            fontWeight: FontWeight.bold,
                            color: Color(0xfff1f1f1))),
                    TextSpan(text: 'and other fun stuff.')
                  ],
                ),
                style: body1(context).copyWith(color: Color(0xfff1f1f1)),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        padding: EdgeInsets.symmetric(
                          vertical: 12,
                        )),
                    icon: FaIcon(
                      FontAwesomeIcons.discord,
                      size: 18,
                    ),
                    onPressed: () {
                      launch(
                        'https://go.dsckiet.com/discord',
                      );
                    },
                    label: Text(
                      'Discord',
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        padding: EdgeInsets.symmetric(
                          vertical: 12,
                        )),
                    icon: FaIcon(
                      FontAwesomeIcons.telegramPlane,
                      size: 18,
                    ),
                    onPressed: () {
                      launch('https://t.me/dsckiet');
                    },
                    label: Text(
                      'Telegram',
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
