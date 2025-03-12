import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'presentation/app.dart';

Future<void> main() async {



  Future<void> startApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      //  options: DefaultFirebaseOptions.currentPlatform,
    );
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
