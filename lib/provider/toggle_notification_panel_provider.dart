import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
