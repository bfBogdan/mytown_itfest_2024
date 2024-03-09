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
    apiKey: 'AIzaSyDJiEpUcgffekrZSrCqMGQzxGLgl8MH5D0',
    appId: '1:923456110574:web:1ae6010ebe35912f8198ff',
    messagingSenderId: '923456110574',
    projectId: 'mytown-594e9',
    authDomain: 'mytown-594e9.firebaseapp.com',
    storageBucket: 'mytown-594e9.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD666OwcpQRU51UWPdE9YEN7GiskYyCuSA',
    appId: '1:923456110574:android:cb5e6033f4b006688198ff',
    messagingSenderId: '923456110574',
    projectId: 'mytown-594e9',
    storageBucket: 'mytown-594e9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD1cUMMbtxQr1CIimvGgIrAJo0C9q1oZ9Q',
    appId: '1:923456110574:ios:2915ff35c262ef528198ff',
    messagingSenderId: '923456110574',
    projectId: 'mytown-594e9',
    storageBucket: 'mytown-594e9.appspot.com',
    iosBundleId: 'com.example.mytownItfest2024',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD1cUMMbtxQr1CIimvGgIrAJo0C9q1oZ9Q',
    appId: '1:923456110574:ios:f162c03b13b097208198ff',
    messagingSenderId: '923456110574',
    projectId: 'mytown-594e9',
    storageBucket: 'mytown-594e9.appspot.com',
    iosBundleId: 'com.example.mytownItfest2024.RunnerTests',
  );
}