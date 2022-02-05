// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
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
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBatT7ULXQCYIfe6HbS7H8E7ibrj_908js',
    appId: '1:1061430859295:web:0d949a6e3fd217e35c672a',
    messagingSenderId: '1061430859295',
    projectId: 'uoftadventurerguild',
    authDomain: 'uoftadventurerguild.firebaseapp.com',
    storageBucket: 'uoftadventurerguild.appspot.com',
    measurementId: 'G-D51SSZ6W45',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDfJQ_bVc2Ct0uSZedWdG158T5KYjY6vxo',
    appId: '1:1061430859295:android:24ea69af22663c8b5c672a',
    messagingSenderId: '1061430859295',
    projectId: 'uoftadventurerguild',
    storageBucket: 'uoftadventurerguild.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB_zlBrpVZvWfC_296eimpNKpEySFYzZQM',
    appId: '1:1061430859295:ios:7c373a5e5e2cab085c672a',
    messagingSenderId: '1061430859295',
    projectId: 'uoftadventurerguild',
    storageBucket: 'uoftadventurerguild.appspot.com',
    iosClientId: '1061430859295-n6q31j52eq8522dtbbsa567tio8seg4m.apps.googleusercontent.com',
    iosBundleId: 'com.uoft.uoftadventurerguild',
  );
}
