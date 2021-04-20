import 'package:dsc_kiet_mobile_app/provider/screen_provider.dart';
import 'package:dsc_kiet_mobile_app/screens/faq_screen.dart';
import 'package:dsc_kiet_mobile_app/screens/guidelines_screen.dart';
import 'package:dsc_kiet_mobile_app/screens/about_us_screen.dart';
import 'package:dsc_kiet_mobile_app/screens/team_screen.dart';
import 'package:dsc_kiet_mobile_app/screens/contact_screen.dart';
import 'package:dsc_kiet_mobile_app/widgets/app_drawer.dart';
import 'package:dsc_kiet_mobile_app/widgets/newsletter_placeholder.dart';
import 'package:dsc_kiet_mobile_app/widgets/workspace_placeholder.dart';
import 'package:dsc_kiet_mobile_app/widgets/explore_placeholder.dart';
import 'package:dsc_kiet_mobile_app/widgets/about_us_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class Homescreen extends ConsumerWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final selectedScreenNotifier = watch(selectedScreenProvider);

    Widget returnScreen() {
      switch (selectedScreenNotifier.value) {
        case 0:
          return HomescreenBody();
          break;
        case 1:
          return AboutUsScreen();
          break;
        case 2:
          return TeamScreen();
          break;
        case 3:
          return GuidelinesScreen();
          break;
        case 4:
          return FAQScreen();
          break;
        case 5:
          return ContactScreen();
          break;
        default:
          return HomescreenBody();
      }
    }

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
      body: returnScreen(),
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
          padding: EdgeInsets.only(right: size.width / 2.5),
          child: ElevatedButton(
              onPressed: () {
                launch('https://forms.gle/YFTsmarHBrW57k5N8');
                print(size.height);
                print(size.width);
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
                    fontSize: size.height / 60,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0f9d58)),
              )),
        ),
        Padding(padding: EdgeInsets.only(top: size.height / 16)),
        //
        //About us section
        AboutUsSection(),
        //
        //join the workspace
        WorkspacePlaceholder(),
        Padding(padding: EdgeInsets.only(bottom: 40)),
        //
        //newsletter
        NewsletterPlaceholder(),
        Padding(padding: EdgeInsets.only(bottom: 80)),
        //
        //Explore Section
        Text(
          'Explore',
          style: Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 20),
        ),
        Padding(padding: EdgeInsets.only(top: 10)),
        ExplorePlaceholder(),
      ],
    );
  }
}
