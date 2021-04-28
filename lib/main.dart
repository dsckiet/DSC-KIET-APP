import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dsc_app.dart';

void main() {
  runApp(
    ProviderScope(child: DscApp()),
  );
}
