import 'package:dsc_kiet_mobile_app/provider/screen_provider.dart';
import 'package:dsc_kiet_mobile_app/widgets/google_map_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ExplorePlaceholder extends ConsumerWidget {
  const ExplorePlaceholder({
    Key key,
  }) : super(key: key);

//   @override
//   _ExplorePlaceholderState createState() => _ExplorePlaceholderState();
// }

// class _ExplorePlaceholderState extends State<ExplorePlaceholder> {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
          child: Text('KIET Group of Institutions'),
          onPressed: () {
            launch('https://www.kiet.edu/');
          },
        ),
        TextButton(
          child: Text('About Us'),
          onPressed: () {
            context.read(selectedScreenProvider).changeScreen(1);
          },
        ),
        TextButton(
          child: Text('Become a member'),
          onPressed: () {
            launch("https://forms.gle/YFTsmarHBrW57k5N8");
          },
        ),
        Padding(padding: EdgeInsets.only(top: 20)),
        TextButton(
          child: Text('Community Guidelines'),
          onPressed: () {
            context.read(selectedScreenProvider).changeScreen(3);
          },
        ),
        TextButton(
          child: Text('Meet the team'),
          onPressed: () {
            context.read(selectedScreenProvider).changeScreen(2);
          },
        ),
        TextButton(
          child: Text('FAQs'),
          onPressed: () {
            context.read(selectedScreenProvider).changeScreen(4);
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: FaIcon(
                FontAwesomeIcons.instagram,
                color: Color(0xff4285F4),
              ),
              onPressed: () {
                launch('https://instagram.com/dsckiet');
              },
            ),
            IconButton(
              icon: FaIcon(
                FontAwesomeIcons.twitter,
                color: Color(0xff4285F4),
              ),
              onPressed: () {
                launch('https://twitter.com/dsckiet');
              },
            ),
            IconButton(
              icon: FaIcon(
                FontAwesomeIcons.github,
                color: Color(0xff4285F4),
              ),
              onPressed: () {
                launch('https://github.com/dsckiet');
              },
            ),
            IconButton(
              icon: FaIcon(
                FontAwesomeIcons.mediumM,
                color: Color(0xff4285F4),
              ),
              onPressed: () {
                launch('https://medium.com/dsckiet');
              },
            ),
            IconButton(
              icon: FaIcon(
                FontAwesomeIcons.telegramPlane,
                color: Color(0xff4285F4),
              ),
              onPressed: () {
                launch('https://t.me/dsckiet');
              },
            ),
            IconButton(
              icon: FaIcon(
                FontAwesomeIcons.slack,
                color: Color(0xff4285F4),
              ),
              onPressed: () {
                launch(
                    'https://join.slack.com/t/dsckiet/shared_invite/zt-ef1q4txj-D77khvaZVgBP2CyH2MQHLA');
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Write to us at: ',
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  .copyWith(fontSize: 16, fontWeight: FontWeight.normal),
            ),
            TextButton(
              onPressed: () {
                launch(
                  Uri(
                    scheme: 'mailto',
                    path: 'dsckiet@gmail.com',
                  ).toString(),
                );
              },
              child: Text(
                'dsckiet@gmail.com',
                style: Theme.of(context).textTheme.bodyText2.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
              ),
            ),
          ],
        ),
        Padding(padding: EdgeInsets.only(top: 20)),
        GooglemapWidget(),
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
        Padding(padding: EdgeInsets.only(top: 20)),
      ],
    );
  }
}
