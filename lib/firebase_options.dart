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
    apiKey: 'AIzaSyC0rVtz9Wfb8T_2SmfVownDmYEPLEeNNpE',
    appId: '1:181871496356:web:ff4aad35932d99817dea31',
    messagingSenderId: '181871496356',
    projectId: 'tut68-c54da',
    authDomain: 'tut68-c54da.firebaseapp.com',
    storageBucket: 'tut68-c54da.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBpF47ES23OFclEBopaussYf8vLTvqeKO8',
    appId: '1:181871496356:android:b50c765c27d378057dea31',
    messagingSenderId: '181871496356',
    projectId: 'tut68-c54da',
    storageBucket: 'tut68-c54da.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB_HegSRqrrdmQe0sYKkStmd1OzokPHikg',
    appId: '1:181871496356:ios:2d8f2a93210408877dea31',
    messagingSenderId: '181871496356',
    projectId: 'tut68-c54da',
    storageBucket: 'tut68-c54da.appspot.com',
    iosBundleId: 'com.example.tut68',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB_HegSRqrrdmQe0sYKkStmd1OzokPHikg',
    appId: '1:181871496356:ios:9130355483504cdb7dea31',
    messagingSenderId: '181871496356',
    projectId: 'tut68-c54da',
    storageBucket: 'tut68-c54da.appspot.com',
    iosBundleId: 'com.example.tut68.RunnerTests',
  );
}
