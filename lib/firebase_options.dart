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
    apiKey: 'AIzaSyBQAp4DmKxxiKhez7Z60IPd5X5i31PsjZQ',
    appId: '1:1088762256811:web:d5ff54ce8e9648b4b586ee',
    messagingSenderId: '1088762256811',
    projectId: 'boardgameranking',
    authDomain: 'boardgameranking.firebaseapp.com',
    databaseURL: 'https://boardgameranking-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'boardgameranking.appspot.com',
    measurementId: 'G-22LLJ790N7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDw_yg419QSrlRCPnbTrKQNektsPiGCubI',
    appId: '1:1088762256811:android:50d292a5a3396cf9b586ee',
    messagingSenderId: '1088762256811',
    projectId: 'boardgameranking',
    databaseURL: 'https://boardgameranking-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'boardgameranking.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC4VCBUershYWdtlr41K_d94YSVT_cTImc',
    appId: '1:1088762256811:ios:4d4475286f365475b586ee',
    messagingSenderId: '1088762256811',
    projectId: 'boardgameranking',
    databaseURL: 'https://boardgameranking-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'boardgameranking.appspot.com',
    iosClientId: '1088762256811-u4b06f2ocg8u2rmgb0c1c1cdoa12baa8.apps.googleusercontent.com',
    iosBundleId: 'com.example.boardgames',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC4VCBUershYWdtlr41K_d94YSVT_cTImc',
    appId: '1:1088762256811:ios:329275fa315ec29ab586ee',
    messagingSenderId: '1088762256811',
    projectId: 'boardgameranking',
    databaseURL: 'https://boardgameranking-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'boardgameranking.appspot.com',
    iosClientId: '1088762256811-sdumgq2n1dt431a0pfg24063g1i7u7li.apps.googleusercontent.com',
    iosBundleId: 'com.example.boardgames.RunnerTests',
  );
}
