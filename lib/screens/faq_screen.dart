import 'package:dsc_kiet_mobile_app/repository/data/faqs.dart';
import 'package:dsc_kiet_mobile_app/widgets/explore_placeholder.dart';
import 'package:flutter/material.dart';

class FAQScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'FAQ\'s',
              style:
                  Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 26),
            ),
            ...faq.map((e) => buildFAQ(context, e['query'], e['response'])),
            Padding(padding: EdgeInsets.only(top: 40)),
            Text(
              'Explore',
              style:
                  Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 20),
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            ExplorePlaceholder(),
          ],
        ),
      ),
    );
  }

  Padding buildFAQ(BuildContext context, String query, String response) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            query,
            style: Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 20),
          ),
          Padding(padding: EdgeInsets.only(top: 16)),
          Text(
            response,
            style: Theme.of(context).textTheme.bodyText2.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                wordSpacing: 2,
                height: 1.5,
                color: Color(0xff707070)),
          ),
        ],
      ),
    );
  }
}
