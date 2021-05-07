import 'package:flutter/services.dart';

class CreateNotifChannel {
  static const MethodChannel _channel =
      MethodChannel('notification_channel_dsc');

  Map<String, String> channelMap = {
    "id": "events_notification_channel",
    "name": "events notification",
    "description": "Notifications related to events conducted by dsc kiet",
  };

  createNotificationChannel() async {
    try {
      await _channel.invokeMethod('createNotificationChannel', channelMap);
    } on PlatformException catch (e) {
      print(e);
    }
  }
}
