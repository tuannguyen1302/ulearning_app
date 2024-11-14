import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'presentation/app.dart';

void main() {
  Future<void> startApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(
      const ProviderScope(
        child: App(),
      ),
    );
  }

  runZonedGuarded(
    () {
      startApp();
    },
    (error, stackTrace) {
      if (kDebugMode) {
        print('Có lỗi xảy ra: $error');
      }
      if (kDebugMode) {
        print('Stack trace: $stackTrace');
      }
    },
  );
}
