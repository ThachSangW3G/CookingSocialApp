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
    apiKey: 'AIzaSyDT9PtngeWYMRH6X86iER_LMPkFOJ_DRqc',
    appId: '1:230194979617:web:dce6dcf80cdcdf610b1460',
    messagingSenderId: '230194979617',
    projectId: 'cookingsocialapp',
    authDomain: 'cookingsocialapp.firebaseapp.com',
    storageBucket: 'cookingsocialapp.appspot.com',
    measurementId: 'G-EHHFN0P52R',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCL0HFTv18sDqyGFPizpDzbc-6FB60z78o',
    appId: '1:230194979617:android:d6618de25348565e0b1460',
    messagingSenderId: '230194979617',
    projectId: 'cookingsocialapp',
    storageBucket: 'cookingsocialapp.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDneD0MNhhXw5rxjg-aMSR01QlX4U7kvX0',
    appId: '1:230194979617:ios:048522f253e6e6ad0b1460',
    messagingSenderId: '230194979617',
    projectId: 'cookingsocialapp',
    storageBucket: 'cookingsocialapp.appspot.com',
    iosClientId: '230194979617-s8dl7h7rip023m1alo9fumj9pf793oee.apps.googleusercontent.com',
    iosBundleId: 'com.example.cookingSocialApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDneD0MNhhXw5rxjg-aMSR01QlX4U7kvX0',
    appId: '1:230194979617:ios:a1cbce09284e363f0b1460',
    messagingSenderId: '230194979617',
    projectId: 'cookingsocialapp',
    storageBucket: 'cookingsocialapp.appspot.com',
    iosClientId: '230194979617-4ao9g5kr75oc0gupn2jd5rvdk6jt6842.apps.googleusercontent.com',
    iosBundleId: 'com.example.cookingSocialApp.RunnerTests',
  );
}
