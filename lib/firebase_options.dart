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
    apiKey: 'AIzaSyByRZTI5NJ_V3OF5tEOzQ1lJx13dx6rumY',
    appId: '1:762825912890:web:c363a5b69236e6b35efb03',
    messagingSenderId: '762825912890',
    projectId: 'notas-516ad',
    authDomain: 'notas-516ad.firebaseapp.com',
    storageBucket: 'notas-516ad.appspot.com',
    measurementId: 'G-JJBYBSS604',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBt3sMZHg19AtVAc582fqGaMxEhFyQfTSA',
    appId: '1:762825912890:android:5ce913d771c5f6b75efb03',
    messagingSenderId: '762825912890',
    projectId: 'notas-516ad',
    storageBucket: 'notas-516ad.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD03y_3K62y8FTHKbDbnOdcanH02McZvwk',
    appId: '1:762825912890:ios:40dbdbd8d3bad6925efb03',
    messagingSenderId: '762825912890',
    projectId: 'notas-516ad',
    storageBucket: 'notas-516ad.appspot.com',
    iosClientId: '762825912890-udsjimadn51jojit44td1hmcdmmerdmu.apps.googleusercontent.com',
    iosBundleId: 'com.example.notasApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD03y_3K62y8FTHKbDbnOdcanH02McZvwk',
    appId: '1:762825912890:ios:40dbdbd8d3bad6925efb03',
    messagingSenderId: '762825912890',
    projectId: 'notas-516ad',
    storageBucket: 'notas-516ad.appspot.com',
    iosClientId: '762825912890-udsjimadn51jojit44td1hmcdmmerdmu.apps.googleusercontent.com',
    iosBundleId: 'com.example.notasApp',
  );
}