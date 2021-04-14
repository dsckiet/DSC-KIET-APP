import 'package:dsc_kiet_mobile_app/screens/team_screen.dart';
import 'package:dsc_kiet_mobile_app/widgets/app_drawer.dart';
import 'package:dsc_kiet_mobile_app/widgets/newsletter_placeholder.dart';
import 'package:dsc_kiet_mobile_app/widgets/workspace_placeholder.dart';
import 'package:dsc_kiet_mobile_app/widgets/explore_placeholder.dart';
import 'package:dsc_kiet_mobile_app/widgets/about_us_section.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class Homescreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leadingWidth: 72.0,
        titleSpacing: 8,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                print('1');
                _scaffoldKey.currentState.openEndDrawer();
              },
              child: Center(
                  child:
                      FaIcon(FontAwesomeIcons.ellipsisV, color: Colors.black)),
            ),
          )
        ],
        leading: Container(
            padding: EdgeInsets.only(left: 16, top: 4, bottom: 4),
            child: Image.asset(
              'assets/images/logo.png',
            )),
        title: Text('DSC KIET'),
      ),
      endDrawer: AppDrawer(),
      body: TeamScreen(),
    );
  }
}

class HomescreenBody extends StatelessWidget {
  const HomescreenBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView(
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
              onPressed: () {
                launch('https://forms.gle/YFTsmarHBrW57k5N8');
              },
              child: Container(
                child: Center(
                  child: Text('Become a member'),
                ),
              )),
        ),
        Padding(padding: EdgeInsets.only(top: 10)),
        Align(
          alignment: Alignment.centerLeft,
          child: TextButton(
              onPressed: () {
                launch(
                    'https://dsc.community.dev/kiet-group-of-institutions-ghaziabad/');
              },
              child: Text(
                'Join Community Platform by Google Developers',
                style: Theme.of(context).textTheme.bodyText2.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0f9d58)),
              )),
        ),
        Padding(padding: EdgeInsets.only(top: 10)),
        //
        //About us section
        AboutUsSection(),
        //
        //join the workspace
        WorkspacePlaceholder(size: size),
        Padding(padding: EdgeInsets.only(bottom: 40)),
        //
        //newsletter
        NewsletterPlaceholder(
          size: size,
        ),
        Padding(padding: EdgeInsets.only(bottom: 80)),
        //
        //Explore Section
        Text(
          'Explore',
          style: Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 20),
        ),
        ExplorePlaceholder(),
        //
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
        )
      ],
    );
  }
}
