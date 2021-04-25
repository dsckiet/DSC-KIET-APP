import 'package:dsc_kiet_mobile_app/repository/data/community-guidelines.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GuidelinesPanel extends StatefulWidget {
  const GuidelinesPanel({
    Key key,
  }) : super(key: key);

  @override
  _GuidelinesPanelState createState() => _GuidelinesPanelState();
}

class _GuidelinesPanelState extends State<GuidelinesPanel> {
  bool _selected = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: ExpansionTile(
        title: Text(
          'Community Guidelines',
          style: Theme.of(context).textTheme.bodyText2.copyWith(
                fontSize: 18,
                color: _selected ? Colors.black : Color(0xff707070),
              ),
        ),
        children: [
          GuidelinesWidget(),
        ],
        tilePadding: EdgeInsets.all(0),
        leading: SvgPicture.asset(
          'assets/icons/guidelines.svg',
          color: _selected ? Colors.black : Color(0xff707070),
          height: 36,
        ),
        onExpansionChanged: (value) {
          _selected = value;
          setState(() {});
        },
      ),
    );
  }
}

class GuidelinesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...communityData.map((e) => ListTile(
              leading: SvgPicture.asset(
                'assets/icons/bullets.svg',
                height: 16,
              ),
              contentPadding: EdgeInsets.all(0),
              enabled: false,
              horizontalTitleGap: 0,
              minVerticalPadding: 12,
              minLeadingWidth: 18,
              visualDensity: VisualDensity.standard,
              title: Text(
                e,
                style: Theme.of(context).textTheme.bodyText2.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Color(0xff707070),
                    height: 1.5),
              ),
            )),
      ],
    );
  }
}
