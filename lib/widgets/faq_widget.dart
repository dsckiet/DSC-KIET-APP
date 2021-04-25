import 'package:dsc_kiet_mobile_app/repository/data/faqs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FAQPanel extends StatefulWidget {
  const FAQPanel({
    Key key,
  }) : super(key: key);

  @override
  _FAQPanelState createState() => _FAQPanelState();
}

class _FAQPanelState extends State<FAQPanel> {
  bool _selected = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          color: Color(0xfff1f1f1), borderRadius: BorderRadius.circular(10)),
      child: ExpansionTile(
        title: Text('FAQ\'s',
            style: Theme.of(context).textTheme.bodyText2.copyWith(
                  fontSize: 18,
                  color: _selected ? Colors.black : Color(0xff707070),
                )),
        children: [
          FAQ(),
        ],
        tilePadding: EdgeInsets.all(0),
        leading: SvgPicture.asset(
          'assets/icons/faq.svg',
          height: 36,
          color: _selected ? Colors.black : Color(0xff707070),
        ),
        onExpansionChanged: (value) {
          _selected = value;
          setState(() {});
        },
      ),
    );
  }
}

class FAQ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...faq.map((e) => buildFAQ(context, e['query'], e['response'])),
      ],
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
