import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../../firebase_options.dart';

class ApplicationStart {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();

    if (kIsWeb || Platform.isAndroid || Platform.isIOS) {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    }
  }
}
