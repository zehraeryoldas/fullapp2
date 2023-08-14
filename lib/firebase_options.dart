// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCwAj-O8rmDjlKxjKkG57nimR4dAW6s_Z4',
    appId: '1:494415179158:web:a219e8be726864ce7141b7',
    messagingSenderId: '494415179158',
    projectId: 'fullapp-5167d',
    authDomain: 'fullapp-5167d.firebaseapp.com',
    storageBucket: 'fullapp-5167d.appspot.com',
    measurementId: 'G-C5DZENVVCY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCaJCYpR5tiduWQu_eDjhzX_4g2XpfQSyA',
    appId: '1:494415179158:android:95122cb9b690ede77141b7',
    messagingSenderId: '494415179158',
    projectId: 'fullapp-5167d',
    storageBucket: 'fullapp-5167d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAkAp4HpjbFmEpk9v3a48S2BHxYoFsuB78',
    appId: '1:494415179158:ios:36817a9b45d1ea627141b7',
    messagingSenderId: '494415179158',
    projectId: 'fullapp-5167d',
    storageBucket: 'fullapp-5167d.appspot.com',
    iosClientId: '494415179158-g4lb29e63rbns0e1f3na4m6lo7gu8jke.apps.googleusercontent.com',
    iosBundleId: 'com.example.fullapp2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAkAp4HpjbFmEpk9v3a48S2BHxYoFsuB78',
    appId: '1:494415179158:ios:bd11acfcaa3b23097141b7',
    messagingSenderId: '494415179158',
    projectId: 'fullapp-5167d',
    storageBucket: 'fullapp-5167d.appspot.com',
    iosClientId: '494415179158-eg3u6k1r62iklgtfrhrh7bhrnfr97gen.apps.googleusercontent.com',
    iosBundleId: 'com.example.fullapp2.RunnerTests',
  );
}
