import 'package:dsckiet/services/utility.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';

class FirebaseNotifications {
  final _instance = FirebaseMessaging.instance;
  final _utility = Utility();
  Future<void> subscribeTonotifications() async {
    _instance.subscribeToTopic("events");
  }

  recieveForegroundMesssage(BuildContext context) {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message != null) {
        _utility.showAlertDialog(message, context);
      }
    });
  }

  showMessageFromTerminatedState(BuildContext context) async {
    final messagefromTerminatedstate = await _instance.getInitialMessage();
    if (messagefromTerminatedstate != null)
      _utility.showAlertDialog(messagefromTerminatedstate, context);
  }

  recieveBackgroundMessage(BuildContext context) {
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      if (message != null) _utility.showAlertDialog(message, context);
    });
  }
}
