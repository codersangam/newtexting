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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyACjK8wbJjl3ttwfcVbViumvZPYYi3rOk0',
    appId: '1:8892157330:web:4a6d1f9862b234ced5854b',
    messagingSenderId: '8892157330',
    projectId: 'dating-quick-chat',
    authDomain: 'dating-quick-chat.firebaseapp.com',
    storageBucket: 'dating-quick-chat.appspot.com',
    measurementId: 'G-RT5H51M79F',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC1MOxtzd6tnWsBpRcLjooVly5tor5Taeg',
    appId: '1:8892157330:android:017060a719d8073ad5854b',
    messagingSenderId: '8892157330',
    projectId: 'dating-quick-chat',
    storageBucket: 'dating-quick-chat.appspot.com',
  );
}
