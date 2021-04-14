import 'package:dsc_kiet_mobile_app/repository/data/team.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class TeamScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Team',
              style:
                  Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 26),
            ),
            Padding(padding: EdgeInsets.only(top: 16)),
            Text(
              'We are a group of excited people with a clear sense of purpose. We believe in continuous learning and development. We are adaptive to upcoming challenges in technology and management. We learn, code, preach, and grow together. Here at DSC KIET, we are not just a team, we are a growing family of developers.',
              style: Theme.of(context).textTheme.bodyText2.copyWith(
                  fontSize: 16, fontWeight: FontWeight.normal, height: 1.5),
            ),
            Padding(padding: EdgeInsets.only(top: 16)),
            ...team.map(
              (e) => buildTeamMemberPane(context, e),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTeamMemberPane(BuildContext context, Map<String, String> data) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
                shape: BoxShape.circle, border: Border.all(color: Colors.grey)),
            child: CircleAvatar(
              radius: 48,
              backgroundImage: AssetImage(data['image']),
            ),
          ),
          Padding(padding: EdgeInsets.only(right: 32)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data['name'],
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(fontSize: 16, color: Color(0xff4285F4)),
              ),
              Padding(padding: EdgeInsets.only(top: 16)),
              Container(
                // height: 40,
                width: size.width / 1.9,
                child: Text(
                  data['role'],
                  style: Theme.of(context).textTheme.bodyText2.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Color(0xff707070),
                      ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 16)),
              Row(
                children: [
                  TextButton.icon(
                      onPressed: () {
                        launch(data['other_url']);
                      },
                      icon: FaIcon(FontAwesomeIcons.link, size: 12),
                      label: Text('')),
                  TextButton.icon(
                      onPressed: () {
                        launch(data['github']);
                      },
                      icon: FaIcon(FontAwesomeIcons.github, size: 12),
                      label: Text('')),
                  TextButton.icon(
                      onPressed: () {
                        launch(data['linkedin']);
                      },
                      icon: FaIcon(FontAwesomeIcons.linkedin, size: 12),
                      label: Text('')),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
