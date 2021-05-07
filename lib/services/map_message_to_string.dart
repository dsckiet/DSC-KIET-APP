import 'package:firebase_messaging/firebase_messaging.dart';

String mapMessageToString(RemoteMessage message) {
  return message.notification.title +
          "%" +
          message.notification.body +
          "%" +
          message.notification.android.imageUrl +
          "%" +
          message.data['link'] ??
      "" + "%" + message.data['time'] ??
      "";
}

Map<String, String> mapStringtoMap(String value) {
  final list = value.split("%");
  return {
    "title": list[0],
    "body": list[1],
    "image_url": list[2],
    "link": list[3],
    "time": list[4],
  };
}
