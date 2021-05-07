import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//provider for getting recent notifications from device
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

//provider for toggling notification panel
final toggleNotificationPanelProvider =
    ChangeNotifierProvider((ref) => ToggleNotificationPanel());

class ToggleNotificationPanel extends ChangeNotifier {
  bool _value = false;
  bool get value => _value;

  void togglePanel(bool value) {
    _value = value;
    notifyListeners();
  }
}

//provider for showing red dot on notification icon
final redDotProvider = ChangeNotifierProvider((ref) => RedDot());

class RedDot extends ChangeNotifier {
  bool _value = false;
  bool get value => _value;

  void toggle(bool value) {
    _value = value;
    notifyListeners();
  }
}
