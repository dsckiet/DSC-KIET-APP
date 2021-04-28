import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedScreenProvider = ChangeNotifierProvider((ref) => SelectScreen());

class SelectScreen extends ChangeNotifier {
  int _value = 1;
  int get value => _value;

  void changeScreen(int value) {
    _value = value;
    notifyListeners();
  }
}
