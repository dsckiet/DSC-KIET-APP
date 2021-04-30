import 'package:dsc_kiet_mobile_app/constants.dart';
import 'package:dsc_kiet_mobile_app/repository/data/team.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:supercharged/supercharged.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dsc_kiet_mobile_app/provider/team_member_selected_notifier.dart';

class TeamScreen extends StatefulWidget {
  @override
  _TeamScreenState createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
  int selected = -1;

  ImageProvider teamImage = AssetImage('assets/images/team.png');

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
              style: heading(context),
            ),
            Padding(padding: EdgeInsets.only(top: 16)),
            Text(
              'We are a group of excited people with a clear sense of purpose. We believe in continuous learning and development. We are adaptive to upcoming challenges in technology and management. We learn, code, preach, and grow together. Here at DSC KIET, we are not just a team, we are a growing family of developers.',
              style: Theme.of(context).textTheme.bodyText2.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  height: 1.6,
                  wordSpacing: 1.6,
                  color: Color(0xff707070)),
            ),
            Padding(padding: EdgeInsets.only(top: 16)),
            ...team.map(
              (e) => TeamMemberPanel(data: e, i: team.indexOf(e)),
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
          ],
        ),
      ),
    );
  }
}

class TeamMemberPanel extends ConsumerWidget {
  const TeamMemberPanel({
    Key key,
    @required this.data,
    @required this.i,
  });

  final Map<String, String> data;
  final int i;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final size = MediaQuery.of(context).size;
    final notifier = watch(selectedTeamMember);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            AnimatedContainer(
              duration: 500.milliseconds,
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                  color: notifier.value == i ? Color(0xff4285f4) : Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: notifier.value == i
                          ? Colors.transparent
                          : Colors.grey)),
              child: GestureDetector(
                onTap: () {
                  context.read(selectedTeamMember).selectMember(i);
                },
                child: CircleAvatar(
                  radius: 48,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 44,
                    backgroundImage: AssetImage(data['image']),
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(right: 32)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data['name'],
                  style: body1(context).copyWith(
                      color: Color(0xff4285F4), fontWeight: FontWeight.bold),
                ),
                Padding(padding: EdgeInsets.only(top: 8)),
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
                        icon: FaIcon(FontAwesomeIcons.link, size: 16),
                        label: Text('')),
                    Padding(padding: EdgeInsets.only(right: 8)),
                    TextButton.icon(
                        onPressed: () {
                          launch(data['github']);
                        },
                        icon: FaIcon(FontAwesomeIcons.github, size: 16),
                        label: Text('')),
                    Padding(padding: EdgeInsets.only(right: 8)),
                    TextButton.icon(
                        onPressed: () {
                          launch(data['linkedin']);
                        },
                        icon: FaIcon(FontAwesomeIcons.linkedin, size: 16),
                        label: Text('')),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
