import 'package:dsckiet/screens/events_notification_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirebaseNotifications {
  final _instance = FirebaseMessaging.instance;
  Future<void> subscribeTonotifications() async {
    _instance.subscribeToTopic("events");
  }

  recieveForegroundMesssage(BuildContext context) {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message != null) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => EventNotificationScreen(
            message: message,
          ),
        ));
      }
    });
  }

  showMessageFromTerminatedState(BuildContext context) async {
    final messagefromTerminatedstate = await _instance.getInitialMessage();
    if (messagefromTerminatedstate != null) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => EventNotificationScreen(
          message: messagefromTerminatedstate,
        ),
      ));
    }
  }

  recieveBackgroundMessage(BuildContext context) {
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => EventNotificationScreen(
          message: message,
        ),
      ));
    });
  }
}
