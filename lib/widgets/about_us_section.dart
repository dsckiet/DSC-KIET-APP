import 'package:dsc_kiet_mobile_app/widgets/button_type_1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

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

class AboutUsSection extends StatefulWidget {
  const AboutUsSection({
    Key key,
  }) : super(key: key);

  @override
  _AboutUsSectionState createState() => _AboutUsSectionState();
}

class _AboutUsSectionState extends State<AboutUsSection> {
  int _selected = -1;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final String whatWeDo =
        '\nGoogle collaborates with university students who are passionate about growing developer communities.\n\nDeveloper Student Clubs powered by Google Developers is an initiative to help students to grow their knowledge on developer\ntechnologies and more through peer to peer workshops and events, and gain relevant industry experience.';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
              onPressed: () {
                launch(
                    'https://dsc.community.dev/kiet-group-of-institutions-ghaziabad/');
              },
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
              onPressed: () {
                launch('https://developers.google.com/programs/dsc/');
              },
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
            style: Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 28),
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
        //grid for html css etc..
        Container(
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
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                _selected = index;
                print(_selected);
                setState(() {});
              },
              child: Opacity(
                opacity: _selected == index ? 1 : 0.6,
                child: SvgPicture.asset(
                  'assets/icons/${gridSVG[index]}.svg',
                ),
              ),
            ),
          ),
        ),
      ],
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
