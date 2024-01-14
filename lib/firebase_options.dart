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
    apiKey: 'AIzaSyCH_yQEa1vZXDFgs5s5zz0F93V7XK-gdwc',
    appId: '1:68837490990:web:5aff0374e515d2321cbabf',
    messagingSenderId: '68837490990',
    projectId: 'spotifier-f60e9',
    authDomain: 'spotifier-f60e9.firebaseapp.com',
    storageBucket: 'spotifier-f60e9.appspot.com',
    measurementId: 'G-YQXMNVD29X',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCpfLed7KGPYVd014aTUYkW00gT0AZycnM',
    appId: '1:68837490990:android:32ed5644e55dc87a1cbabf',
    messagingSenderId: '68837490990',
    projectId: 'spotifier-f60e9',
    storageBucket: 'spotifier-f60e9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD8KS4qfX6EaO_0ftz4hIs4l0LPmwMV8d4',
    appId: '1:68837490990:ios:26d5cc34344f704b1cbabf',
    messagingSenderId: '68837490990',
    projectId: 'spotifier-f60e9',
    storageBucket: 'spotifier-f60e9.appspot.com',
    iosBundleId: 'com.example.spotifier',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD8KS4qfX6EaO_0ftz4hIs4l0LPmwMV8d4',
    appId: '1:68837490990:ios:b836c1a99a0cd3b61cbabf',
    messagingSenderId: '68837490990',
    projectId: 'spotifier-f60e9',
    storageBucket: 'spotifier-f60e9.appspot.com',
    iosBundleId: 'com.example.spotifier.RunnerTests',
  );
}