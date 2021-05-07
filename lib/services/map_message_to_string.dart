import 'package:firebase_messaging/firebase_messaging.dart';

String mapMessageToString(RemoteMessage message) {
  String a =
      "${message.notification.title}%${message.notification.body}%${message.notification.android.imageUrl}%${message.data['link'] != null ? message.data['link'] : ""}%${message.data['time'] != null ? message.data['time'] : ""}";

  return a;
}

Map<String, String> mapStringtoMap(String value) {
  final list = value.split("%");
  return {
    "title": list[0],
    "body": list[1],
    "image_url": list[2],
    "link": list.length == 4 ? list[3] : null,
    "time": list.length == 5 ? list[4] : null,
  };
}
