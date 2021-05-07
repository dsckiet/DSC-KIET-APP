import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final recentNotificationsProvider =
    ChangeNotifierProvider((ref) => RecentNotifications());

class RecentNotifications extends ChangeNotifier {
  List<String> _value = [];
  List<String> get value => _value;

  void addNotification(String value) {
    if (_value.length == 5) _value.removeAt(4);
    _value.insert(0, value);
    notifyListeners();
  }

  void getNotificationFromDevice(List<String> list) {
    _value = List.from(list);
    notifyListeners();
  }
}
