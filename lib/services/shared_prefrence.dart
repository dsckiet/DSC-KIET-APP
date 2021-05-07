import 'package:dsckiet/provider/notification_providers.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SharedPrefService {
  void getRecentNotifications(BuildContext context) async {
    final _prefs = await SharedPreferences.getInstance();
    List<String> notifications = _prefs.getStringList("notifications") ?? [];
    context
        .read(recentNotificationsProvider)
        .getNotificationFromDevice(notifications);
  }

  void saveNotification(String message, BuildContext context) async {
    context.read(recentNotificationsProvider).addNotification(message);
    final _prefs = await SharedPreferences.getInstance();
    _prefs.setStringList(
        "notifications", context.read(recentNotificationsProvider).value);
  }
}
