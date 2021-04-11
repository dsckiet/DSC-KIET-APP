import 'package:dsc_kiet_mobile_app/widgets/button_type_1.dart';
import 'package:dsc_kiet_mobile_app/widgets/newsletter_placeholder.dart';
import 'package:dsc_kiet_mobile_app/widgets/workspace_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

class Homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final String whatWeDo =
        '\nGoogle collaborates with university students who are passionate about growing developer communities.\n\nDeveloper Student Clubs powered by Google Developers is an initiative to help students to grow their knowledge on developer\ntechnologies and more through peer to peer workshops and events, and gain relevant industry experience.';
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 72.0,
        titleSpacing: 8,
        leading: Container(
            padding: EdgeInsets.only(left: 16, top: 4, bottom: 4),
            child: Image.asset(
              'assets/images/logo.png',
            )),
        title: Text('DSC KIET'),
      ),
      // drawer: Drawer,
      body: ListView(
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
                onPressed: () {},
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
                onPressed: () {},
                child: Text(
                  'Join Community Platform by Google Developers',
                  style: Theme.of(context).textTheme.bodyText2.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff0f9d58)),
                )),
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          Text(
            'What we do?',
          ),
          Text(
            whatWeDo,
            style: Theme.of(context).textTheme.bodyText2.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Color(0xff707070)),
          ),
          Padding(padding: EdgeInsets.only(top: 20)),
          Padding(
            padding: const EdgeInsets.only(right: 200.0),
            child: ElevatedButton(
                onPressed: () {},
                child: Container(
                  child: Center(
                    child: Text('SIGN UP'),
                  ),
                )),
          ),
          Padding(padding: EdgeInsets.only(top: 4)),
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
                onPressed: () {},
                child: Text(
                  'Learn more about the program',
                  style: Theme.of(context).textTheme.bodyText2.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff0f9d58)),
                )),
          ),
          //projects placeholder
          placeholderType1(
            context,
            svg: 'rocket',
            title: 'Projects',
            content: 'Projects with a social impact that help a lot of people.',
            color: Color(0xffDB4437),
          ),
          //hackathons placeholder
          placeholderType1(context,
              svg: 'hackathon',
              title: 'Hackathons',
              content: 'Dream. Explore. Wonder. Build it together.',
              color: Color(0xff4285F4)),
          //webinars placeholder
          placeholderType1(context,
              svg: 'webinar',
              title: 'Webinars',
              content: 'Join live coding sessions and AMAs to explore.',
              color: Color(0xffC8A83D)),
          //bootcamps placeholder
          placeholderType1(context,
              svg: 'bootcamp',
              title: 'Bootcamps',
              content: 'Learn & implement with us in detailed bootcamps.',
              color: Color(0xff0F9D58)),
          Padding(
            padding: EdgeInsets.only(top: 48, bottom: 16),
            child: Text(
              'What DSC KIET does?',
              style:
                  Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 28),
            ),
          ),
          Text(
            'Developer Student Club KIET is inspired by Google Developers\' Family.\n\nThe motive is to create a ecosystem of programmers & developers in the campus by helping them to learn and build projects.',
            style: Theme.of(context).textTheme.bodyText2.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Color(0xff707070)),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.0, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ButtonType1(
                  icon: FontAwesomeIcons.mediumM,
                ),
                ButtonType1(
                  icon: FontAwesomeIcons.instagram,
                ),
                ButtonType1(
                  icon: FontAwesomeIcons.twitter,
                ),
                ButtonType1(
                  icon: FontAwesomeIcons.github,
                ),
              ],
            ),
          ),
          //grid for html css etc..
          Container(
            width: size.width / 3,
            height: size.height / 2.88,
            padding: EdgeInsets.all(10),
            child: GridView.builder(
              clipBehavior: Clip.none,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 1.5,
              ),
              itemCount: gridSVG.length,
              itemBuilder: (context, index) => SvgPicture.asset(
                'assets/icons/${gridSVG[index]}.svg',
                colorBlendMode: BlendMode.dstIn,
                color: Colors.transparent.withOpacity(0.6),
              ),
            ),
          ),
          //join the workspace
          WorkspacePlaceholder(size: size),
          Padding(padding: EdgeInsets.only(bottom: 40)),
          //newsletter
          NewsletterPlaceholder(
            size: size,
          ),
          Padding(padding: EdgeInsets.only(bottom: 80)),
          //Explore Section
          Text(
            'Explore',
            style: Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 20),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                child: Text('KIET Group of Institutions'),
                onPressed: () {},
              ),
              TextButton(
                child: Text('About Us'),
                onPressed: () {},
              ),
              TextButton(
                child: Text('Become a member'),
                onPressed: () {},
              ),
              Padding(padding: EdgeInsets.only(top: 20)),
              TextButton(
                child: Text('Community Guidelines'),
                onPressed: () {},
              ),
              TextButton(
                child: Text('Meet the team'),
                onPressed: () {},
              ),
              TextButton(
                child: Text('FAQs'),
                onPressed: () {},
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.instagram,
                  color: Color(0xff4285F4),
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.twitter,
                  color: Color(0xff4285F4),
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.github,
                  color: Color(0xff4285F4),
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.mediumM,
                  color: Color(0xff4285F4),
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.telegramPlane,
                  color: Color(0xff4285F4),
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.slack,
                  color: Color(0xff4285F4),
                ),
                onPressed: () {},
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
                onPressed: () {},
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
      ),
    );
  }

  Column placeholderType1(BuildContext context,
      {String svg, String title, String content, Color color}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: SvgPicture.asset(
              'assets/icons/$svg.svg',
              height: 48,
              color: color,
            ),
          ),
        ),
        Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyText2.copyWith(
                    fontSize: 24,
                  ),
            )),
        Text(
          content,
          style: Theme.of(context).textTheme.bodyText2.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: Color(0xff707070)),
        )
      ],
    );
  }
}

List<String> gridSVG = [
  'html',
  'css',
  'js',
  'react',
  'nodejs',
  'mongodb',
  'django',
  'flutter',
  'android',
];
