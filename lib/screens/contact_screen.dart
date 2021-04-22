import 'package:dsc_kiet_mobile_app/widgets/button_type_1.dart';
import 'package:dsc_kiet_mobile_app/widgets/footer.dart';
// import 'package:dsc_kiet_mobile_app/widgets/google_map_widget.dart';
import 'package:dsc_kiet_mobile_app/widgets/newsletter_placeholder.dart';
import 'package:dsc_kiet_mobile_app/widgets/workspace_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 20.0, top: 32, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('About Us'),
            Padding(padding: EdgeInsets.only(top: 16)),
            Text(
              'Developer Student Club KIET is inspired by Google Developers Family. We started our journey in Feb 2019. We try to engage student developers through our hack events, codelabs and meetups. The motive is to create a local ecosystem of programmers & hackers in and around the Campus. The technology awareness is main goal for first few years of the group.',
              style: Theme.of(context).textTheme.bodyText2.copyWith(
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                    color: Color(0xff707070),
                    wordSpacing: 1.3,
                    height: 1.4,
                  ),
            ),
            Padding(padding: EdgeInsets.only(top: size.height / 36)),
            Padding(
              padding: EdgeInsets.only(bottom: size.height / 36),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ButtonType1(
                    icon: FontAwesomeIcons.mediumM,
                    url: 'https://medium.com/dsckiet',
                  ),
                  ButtonType1(
                    icon: FontAwesomeIcons.instagram,
                    url: 'https://instagram.com/dsckiet',
                  ),
                  ButtonType1(
                    icon: FontAwesomeIcons.twitter,
                    url: 'https://twitter.com/dsckiet',
                  ),
                  ButtonType1(
                    icon: FontAwesomeIcons.github,
                    url: 'https://github.com/dsckiet',
                  ),
                ],
              ),
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
            Padding(padding: EdgeInsets.only(top: size.height / 24)),
            Container(width: double.infinity, child: WorkspacePlaceholder()),
            Padding(padding: EdgeInsets.only(bottom: 40)),
            Container(width: double.infinity, child: NewsletterPlaceholder()),
            Padding(padding: EdgeInsets.only(top: 40)),
            // Padding(padding: EdgeInsets.only(top: 20)),
            // GooglemapWidget(),
            // Padding(padding: EdgeInsets.only(top: size.height / 48)),
            Footer(),
          ],
        ),
      ),
    );
  }
}
