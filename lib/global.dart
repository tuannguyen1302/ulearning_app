import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

import 'firebase_options.dart';
import 'presentation/services/storage.dart';

class Global {
  static late StorageService  storageService;
  static Future  init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
   storageService = await StorageService().init() ;
  }
}