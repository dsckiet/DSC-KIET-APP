import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ExplorePlaceholder extends StatelessWidget {
  const ExplorePlaceholder({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          onPressed: () {},
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
    );
  }
}
