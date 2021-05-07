import 'package:dsckiet/screens/events_notification_screen.dart';
import 'package:dsckiet/services/map_message_to_string.dart';
import 'package:dsckiet/services/shared_prefrence.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirebaseNotifications {
  final _instance = FirebaseMessaging.instance;
  final SharedPrefService sharedPrefService = SharedPrefService();

  recieveForegroundMesssage(BuildContext context) {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message != null) {
        sharedPrefService.saveNotification(
            mapMessageToString(message), context);
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => EventNotificationScreen(
            data: {
              'title': message.notification.title,
              'body': message.notification.body,
              'image_url': message.notification.android.imageUrl,
              'time': message.data['time'],
              'link': message.data['link'],
            },
          ),
        ));
      }
    });
  }

  showMessageFromTerminatedState(BuildContext context) async {
    final messagefromTerminatedstate = await _instance.getInitialMessage();
    if (messagefromTerminatedstate != null) {
      sharedPrefService.saveNotification(
          mapMessageToString(messagefromTerminatedstate), context);
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => EventNotificationScreen(
          data: {
            'title': messagefromTerminatedstate.notification.title,
            'body': messagefromTerminatedstate.notification.body,
            'image_url':
                messagefromTerminatedstate.notification.android.imageUrl,
            'time': messagefromTerminatedstate.data['time'],
            'link': messagefromTerminatedstate.data['link'],
          },
        ),
      ));
    }
  }

  recieveBackgroundMessage(BuildContext context) {
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      sharedPrefService.saveNotification(mapMessageToString(message), context);
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => EventNotificationScreen(
          data: {
            'title': message.notification.title,
            'body': message.notification.body,
            'image_url': message.notification.android.imageUrl,
            'time': message.data['time'],
            'link': message.data['link'],
          },
        ),
      ));
    });
  }
}
