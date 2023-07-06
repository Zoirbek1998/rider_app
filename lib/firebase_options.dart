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
    apiKey: 'AIzaSyBbiGH0p1lc_ovNXSoC-fSB6SmQqYJN5EI',
    appId: '1:319048828704:web:8176b5597ebdb632ec3945',
    messagingSenderId: '319048828704',
    projectId: 'fir-app-c783b',
    authDomain: 'fir-app-c783b.firebaseapp.com',
    databaseURL: 'https://fir-app-c783b-default-rtdb.firebaseio.com',
    storageBucket: 'fir-app-c783b.appspot.com',
    measurementId: 'G-DZ1GVF21LN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC869czERJloZGkq7wDFaO7SFYmWGO5o1M',
    appId: '1:319048828704:android:bc390ce42f8cc4bdec3945',
    messagingSenderId: '319048828704',
    projectId: 'fir-app-c783b',
    databaseURL: 'https://fir-app-c783b-default-rtdb.firebaseio.com',
    storageBucket: 'fir-app-c783b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCNU9GZED-YsqMbd1DJHvKBpdsPVT8dBIs',
    appId: '1:319048828704:ios:cbbd65b19ab593e6ec3945',
    messagingSenderId: '319048828704',
    projectId: 'fir-app-c783b',
    databaseURL: 'https://fir-app-c783b-default-rtdb.firebaseio.com',
    storageBucket: 'fir-app-c783b.appspot.com',
    iosClientId: '319048828704-bv0h3fe2f3ba8fd2a806a36takt3e0hf.apps.googleusercontent.com',
    iosBundleId: 'com.future.riderApp',
  );
}
