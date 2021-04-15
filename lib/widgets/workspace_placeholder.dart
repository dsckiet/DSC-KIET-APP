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
        width: size.width / 3,
        height: size.height / 3.7,
        padding: EdgeInsets.all(30),
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
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(fontSize: 24, color: Colors.white),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Text.rich(
                TextSpan(
                  text:
                      'Join our Slack and Telegram Channels get instant updates about our ',
                  children: [
                    TextSpan(
                      text: '#activities, #sessions ',
                      style: Theme.of(context).textTheme.bodyText2.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xfff1f1f1)),
                    ),
                    TextSpan(text: 'and other fun stuff.')
                  ],
                ),
                style: Theme.of(context).textTheme.bodyText2.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Color(0xfff1f1f1)),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  style: Theme.of(context).elevatedButtonTheme.style.copyWith(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                      ),
                  icon: FaIcon(FontAwesomeIcons.slack),
                  onPressed: () {
                    launch(
                        'https://join.slack.com/t/dsckiet/shared_invite/zt-ef1q4txj-D77khvaZVgBP2CyH2MQHLA');
                  },
                  label: Text(
                    'Slack',
                  ),
                ),
                ElevatedButton.icon(
                  style: Theme.of(context).elevatedButtonTheme.style.copyWith(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                      ),
                  icon: FaIcon(FontAwesomeIcons.telegramPlane),
                  onPressed: () {
                    launch('https://t.me/dsckiet');
                  },
                  label: Text(
                    'Telegram',
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
