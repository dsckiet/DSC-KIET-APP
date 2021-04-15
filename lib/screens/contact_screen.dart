import 'package:dsc_kiet_mobile_app/widgets/explore_placeholder.dart';
import 'package:dsc_kiet_mobile_app/widgets/newsletter_placeholder.dart';
import 'package:dsc_kiet_mobile_app/widgets/workspace_placeholder.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(width: double.infinity, child: WorkspacePlaceholder()),
            Padding(padding: EdgeInsets.only(bottom: 40)),
            Container(width: double.infinity, child: NewsletterPlaceholder()),
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
