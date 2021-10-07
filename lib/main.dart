import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dsc_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp();
    // FirebaseMessaging.instance.getToken().then((value) => print(value));
  } catch (e) {
    print(e);
  }
  runApp(
    ProviderScope(child: DscApp()),
  );
}
