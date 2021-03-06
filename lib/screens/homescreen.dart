import 'package:dsckiet/constants.dart';
import 'package:dsckiet/provider/screen_notifier_provider.dart';
import 'package:dsckiet/screens/team_screen.dart';
import 'package:dsckiet/screens/contact_screen.dart';
import 'package:dsckiet/services/firebase_messaging.dart';
import 'package:dsckiet/widgets/about_us_section.dart';
import 'package:dsckiet/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

List<Widget> screens = [
  TeamScreen(),
  HomescreenBody(),
  ContactScreen(),
];

class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final _notifications = FirebaseNotifications();
  @override
  void initState() {
    super.initState();
    _notifications.recieveForegroundMesssage(context);
    _notifications.recieveBackgroundMessage(context);
    _notifications.showMessageFromTerminatedState(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer(
        builder: (context, watch, child) {
          final screenNotifier = watch(selectedScreenProvider);
          return Scaffold(
            body: screens[screenNotifier.value],
            bottomNavigationBar: const BottomNavBar(),
            resizeToAvoidBottomInset: true,
          );
        },
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
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20),
      children: [
        largePadding,
        Text(
          'Developer Student Circuit KIET Group of Institutions',
          style: heading(context),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 28.0, top: 4, bottom: 4),
          child: Lottie.asset('assets/images/splash_animation.json'),
        ),
        smallPadding,
        Row(
          children: [
            ElevatedButton(
                onPressed: () {
                  launch('https://forms.gle/YFTsmarHBrW57k5N8');
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 28),
                ),
                child: Text('Become a member')),
          ],
        ),
        const Padding(padding: EdgeInsets.only(top: 10)),
        Align(
          alignment: Alignment.centerLeft,
          child: TextButton(
              onPressed: () {
                launch(
                    'https://dsc.community.dev/kiet-group-of-institutions-ghaziabad/');
              },
              child: Text(
                'Join Community Platform and grow together',
                style: body1(context)
                    .copyWith(color: green, fontWeight: FontWeight.bold),
              )),
        ),
        largePadding,
        //
        //About us section
        AboutUsSection(),
      ],
    );
  }
}
