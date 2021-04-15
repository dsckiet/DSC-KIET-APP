import 'package:dsc_kiet_mobile_app/repository/data/community-guidelines.dart';
import 'package:dsc_kiet_mobile_app/widgets/explore_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GuidelinesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Community Guideline\'s',
              style:
                  Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 26),
            ),
            Padding(padding: EdgeInsets.only(top: 16)),
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
}
