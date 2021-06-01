import 'package:dsckiet/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AboutUsSectionBody(),
          ],
        ),
      ),
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
  'adobe',
  'figma',
  'kotlin',
];

class AboutUsSectionBody extends StatefulWidget {
  const AboutUsSectionBody({
    Key key,
  }) : super(key: key);

  @override
  _AboutUsSectionBodyState createState() => _AboutUsSectionBodyState();
}

class _AboutUsSectionBodyState extends State<AboutUsSectionBody> {
  int _selected = -1;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final String whatWeDo =
        '\nGoogle collaborates with university students who are passionate about growing developer communities.\n\nDeveloper Student Clubs powered by Google Developers is an initiative to help students to grow their knowledge on developer technologies and more through peer to peer workshops and events, and gain relevant industry experience.';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'What is DSC?',
          style: subHeading(context),
        ),
        Text(
          whatWeDo,
          style: body1(context),
        ),
        smallPadding,
        Padding(
          padding: EdgeInsets.only(right: size.width / 1.7),
          child: ElevatedButton(
              onPressed: () {
                launch(
                    'https://dsc.community.dev/kiet-group-of-institutions-ghaziabad/');
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12),
              ),
              child: Container(
                child: Center(
                  child: Text('Sign up'),
                ),
              )),
        ),
        smallPadding,
        Align(
          alignment: Alignment.centerLeft,
          child: TextButton(
              onPressed: () {
                launch('https://developers.google.com/programs/dsc/');
              },
              child: Text(
                'Learn more about the program',
                style: body1(context)
                    .copyWith(color: green, fontWeight: FontWeight.bold),
              )),
        ),
        Padding(padding: EdgeInsets.only(top: 12)),
        //projects placeholder
        placeholderType1(
          context,
          size,
          svg: 'rocket',
          title: 'Projects',
          content: 'Projects with a social impact that help a lot of people.',
          color: Color(0xffDB4437),
        ),
        //hackathons placeholder
        placeholderType1(context, size,
            svg: 'hackathon',
            title: 'Hackathons',
            content: 'Dream. Explore. Wonder. Build it together.',
            color: Color(0xff4285F4)),
        //webinars placeholder
        placeholderType1(context, size,
            svg: 'webinar',
            title: 'Webinars',
            content: 'Join live coding sessions and AMAs to explore.',
            color: Color(0xffF4B400)),
        //bootcamps placeholder
        placeholderType1(context, size,
            svg: 'bootcamp',
            title: 'Bootcamps',
            content: 'Learn & implement with us in detailed bootcamps.',
            color: Color(0xff0F9D58)),
        Padding(
          padding: EdgeInsets.only(top: size.height / 12, bottom: 16),
          child: Text(
            'What DSC KIET does?',
            style: subHeading(context),
          ),
        ),
        Text(
          'Developer Student Clubs KIET is inspired by Google Developers\' Family.\n\nThe motive is to create an ecosystem of programmers & developers in the campus by helping them to learn and build projects.',
          style: body1(context),
        ),
        largePadding,
        //grid for html css etc..
        Table(
          children: [
            TableRow(children: [
              ...gridSVG.getRange(0, 3).map(
                    (e) => GestureDetector(
                      onTap: () {
                        _selected = gridSVG.indexOf(e);
                        setState(() {});
                      },
                      child: Opacity(
                        opacity: _selected == gridSVG.indexOf(e) ? 1 : 0.6,
                        child: SvgPicture.asset(
                          'assets/icons/$e.svg',
                          height: 72,
                        ),
                      ),
                    ),
                  ),
            ]),
            TableRow(
                children: [Container(height: 40), Container(), Container()]),
            TableRow(children: [
              ...gridSVG.getRange(3, 6).map(
                    (e) => GestureDetector(
                      onTap: () {
                        _selected = gridSVG.indexOf(e);
                        setState(() {});
                      },
                      child: Opacity(
                        opacity: _selected == gridSVG.indexOf(e) ? 1 : 0.6,
                        child: SvgPicture.asset(
                          'assets/icons/$e.svg',
                          height: 72,
                        ),
                      ),
                    ),
                  ),
            ]),
            TableRow(
                children: [Container(height: 40), Container(), Container()]),
            TableRow(children: [
              ...gridSVG.getRange(6, 9).map(
                    (e) => GestureDetector(
                      onTap: () {
                        _selected = gridSVG.indexOf(e);
                        setState(() {});
                      },
                      child: Opacity(
                        opacity: _selected == gridSVG.indexOf(e) ? 1 : 0.6,
                        child: SvgPicture.asset(
                          'assets/icons/$e.svg',
                          height: 72,
                        ),
                      ),
                    ),
                  ),
            ]),
            TableRow(
                children: [Container(height: 40), Container(), Container()]),
            TableRow(children: [
              ...gridSVG.getRange(9, 12).map(
                    (e) => GestureDetector(
                      onTap: () {
                        _selected = gridSVG.indexOf(e);
                        setState(() {});
                      },
                      child: Opacity(
                        opacity: _selected == gridSVG.indexOf(e) ? 1 : 0.6,
                        child: SvgPicture.asset(
                          'assets/icons/$e.svg',
                          height: 72,
                        ),
                      ),
                    ),
                  ),
            ]),
          ],
        ),
        largePadding,
        largePadding,
      ],
    );
  }

  Padding placeholderType1(BuildContext context, Size size,
      {String svg, String title, String content, Color color}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: SvgPicture.asset(
                'assets/icons/$svg.svg',
                height: size.height / 17,
                color: color,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              title,
              style: subHeading(context),
            ),
          ),
          Text(
            content,
            style: body1(context),
          )
        ],
      ),
    );
  }
}
