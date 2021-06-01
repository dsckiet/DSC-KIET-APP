import 'package:dsckiet/constants.dart';
import 'package:dsckiet/widgets/guidelines_widget.dart';
import 'package:dsckiet/widgets/button_type_1.dart';
import 'package:dsckiet/widgets/faq_widget.dart';
import 'package:dsckiet/widgets/footer.dart';
import 'package:dsckiet/widgets/newsletter_placeholder.dart';
import 'package:dsckiet/widgets/workspace_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 20.0, top: 32, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'About Us',
                      style: heading(context),
                    ),
                    Spacer(),
                    // Consumer(builder: (context, watch, child) {
                    //   final redDot = watch(redDotProvider);
                    //   return Stack(children: [
                    //     Positioned(
                    //       right: 8,
                    //       top: 8,
                    //       child: Container(
                    //         height: 5,
                    //         decoration: BoxDecoration(
                    //           color: redDot.value
                    //               ? Colors.red
                    //               : Colors.transparent,
                    //           shape: BoxShape.circle,
                    //         ),
                    //         width: 5,
                    //       ),
                    //     ),
                    //     IconButton(
                    //       icon: SvgPicture.asset(
                    //         'assets/icons/notification.svg',
                    //         height: 24,
                    //       ),
                    //       onPressed: () {
                    //         context.read(redDotProvider).toggle(false);
                    //         context
                    //             .read(toggleNotificationPanelProvider)
                    //             .togglePanel(true);
                    //       },
                    //     ),
                    //   ]);
                    // }),
                  ],
                ),
                smallPadding,
                Text(
                    'Developer Student Clubs KIET is inspired by Google Developers Family. We started our journey in Feb 2019. We try to engage student developers through our hack events, codelabs and meetups. The motive is to create a local ecosystem of programmers & hackers in and around the Campus. The technology awareness is main goal for first few years of the group.',
                    style: body1(context)),
                smallPadding,
                Padding(
                  padding: EdgeInsets.only(bottom: size.height / 36),
                  child: FittedBox(
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
                        ButtonType1(
                          icon: FontAwesomeIcons.linkedinIn,
                          url: 'https://www.linkedin.com/company/dsckiet',
                        ),
                        ButtonType1(
                          icon: FontAwesomeIcons.youtube,
                          url: 'https://www.youtube.com/dsckiet',
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Write to us at: ',
                      style: body1(context),
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
                        style: body1(context)
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                largePadding,
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xfff1f1f1),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(2, 2),
                        color: Colors.grey,
                        spreadRadius: 1,
                      )
                    ],
                  ),
                  child: FAQPanel(),
                ),
                smallPadding,
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xfff1f1f1),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(2, 2),
                        color: Colors.grey,
                        spreadRadius: 1,
                      )
                    ],
                  ),
                  child: GuidelinesPanel(),
                ),
                smallPadding,
                Container(
                    width: double.infinity, child: WorkspacePlaceholder()),
                largePadding,
                Container(
                    width: double.infinity, child: NewsletterPlaceholder()),
                Footer(),
              ],
            ),
          ),
        ),
        // NotificationPanel(),
      ],
    );
  }
}
