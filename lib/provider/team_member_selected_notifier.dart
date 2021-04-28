import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedTeamMember = ChangeNotifierProvider((ref) => SelectTemMember());

class SelectTemMember extends ChangeNotifier {
  int _value = -1;
  int get value => _value;

  void selectMember(int value) {
    _value = value;
    notifyListeners();
  }
}
