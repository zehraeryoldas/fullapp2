import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fullapp2/feature/auth/authentication_view.dart';
import 'package:fullapp2/firebase_options.dart';
import 'package:fullapp2/product/constant/string_constant.dart';
import 'package:fullapp2/product/initialize/app_cache.dart';
import 'package:kartal/kartal.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb || Platform.isAndroid || Platform.isIOS) {
    DeviceUtility.instance.initPackageInfo();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    FirebaseUIAuth.configureProviders([
      EmailAuthProvider(), GoogleProvider(clientId: '')
      // ... other providers
    ]);
    await AppCache.instance.setup();
  }

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: StringContants.appName,
        home: AuthenticationView());
  }
}
