import 'package:dsc_kiet_mobile_app/screens/team_screen.dart';
import 'package:dsc_kiet_mobile_app/screens/contact_screen.dart';
import 'package:dsc_kiet_mobile_app/widgets/about_us_section.dart';
import 'package:dsc_kiet_mobile_app/widgets/bottom_nav_bar.dart';
import 'package:dsc_kiet_mobile_app/widgets/footer.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

List<Widget> screens = [
  TeamScreen(),
  HomescreenBody(),
  ContactScreen(),
];

class Homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: 1);

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            PageView(
              children: screens,
              physics: NeverScrollableScrollPhysics(),
              controller: controller,
            ),
            //bottom nav bar
            BottomNavBar(
              controller: controller,
            )
          ],
        ),
      ),
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
        Padding(padding: EdgeInsets.only(top: size.height / 18)),
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 4),
          child: Lottie.asset('assets/images/splash_animation.json'),
        ),
        Padding(padding: EdgeInsets.only(top: 10)),
        Padding(
          padding: EdgeInsets.only(right: size.width / 2.5),
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

        Padding(padding: EdgeInsets.only(top: size.height / 20)),
        //
        //About us section
        AboutUsSection(),
        Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 10)),
      ],
    );
  }
}
