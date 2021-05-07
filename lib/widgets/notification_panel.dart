import 'package:dsckiet/provider/recent_notifications_provider.dart';
import 'package:dsckiet/provider/toggle_notification_panel_provider.dart';
import 'package:dsckiet/screens/events_notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:supercharged/supercharged.dart';

import '../constants.dart';

class NotificationPanel extends ConsumerWidget {
  const NotificationPanel({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final notificationsProvider = watch(recentNotificationsProvider);
    final notificationPanelProvider = watch(toggleNotificationPanelProvider);
    final size = MediaQuery.of(context).size;
    return AnimatedPositioned(
      right: notificationPanelProvider.value ? 0 : -size.width,
      duration: 300.milliseconds,
      child: Container(
        height: size.height,
        width: size.width,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: AnimatedOpacity(
                child: GestureDetector(
                  onTap: () {
                    context
                        .read(toggleNotificationPanelProvider)
                        .togglePanel(false);
                  },
                  child: Container(
                    color: Colors.grey,
                  ),
                ),
                duration: 800.milliseconds,
                curve: Curves.easeInExpo,
                opacity: notificationPanelProvider.value ? 0.4 : 0,
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0, top: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Notifications',
                            style: subHeading(context),
                          ),
                          Spacer(),
                          Material(
                            color: Colors.transparent,
                            shape: CircleBorder(),
                            child: IconButton(
                              icon: Icon(Icons.close),
                              onPressed: () {
                                context
                                    .read(toggleNotificationPanelProvider)
                                    .togglePanel(false);
                              },
                              splashColor: Colors.grey,
                            ),
                          )
                        ],
                      ),
                      Divider(),
                      smallPadding,
                      ...notificationsProvider.value.map((e) {
                        final value = e.split('-');
                        return EventListTile(
                          data: {
                            'title': value[0],
                            'body': value[1],
                            'image_url': value[2],
                            'link': value[3] ?? null,
                            'time': value[4] ?? null,
                          },
                        );
                      }),
                      if (notificationsProvider.value.length == 0)
                        Text('No recent Notifications'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EventListTile extends StatelessWidget {
  const EventListTile({
    Key key,
    this.data,
  }) : super(key: key);

  final Map<String, String> data;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.grey,
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => EventNotificationScreen(
                data: data,
              ),
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              FaIcon(
                FontAwesomeIcons.solidDotCircle,
                size: 18,
                color: Colors.grey,
              ),
              Padding(padding: EdgeInsets.only(right: 10)),
              Expanded(
                child: Text(
                  'Code Breeze 1.0',
                  style: body2(context).copyWith(fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
