// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCJKcYTvLpekXaqKkxwKJZVIu0yMiPIBuQ',
    appId: '1:967610623318:android:9d848b6a1d57d3200322f7',
    messagingSenderId: '967610623318',
    projectId: 'my-app-72fcd',
    storageBucket: 'my-app-72fcd.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBWo-nu7x35VfIrf55C2SnCGoEuXKvLs2w',
    appId: '1:967610623318:ios:b355e60aa4f07e6e0322f7',
    messagingSenderId: '967610623318',
    projectId: 'my-app-72fcd',
    storageBucket: 'my-app-72fcd.firebasestorage.app',
    iosBundleId: 'com.example.tmdtApp',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCgkx0zDap_611HHvisicWaRU0ATuzhRH4',
    appId: '1:967610623318:web:c5121b86e10dbd250322f7',
    messagingSenderId: '967610623318',
    projectId: 'my-app-72fcd',
    authDomain: 'my-app-72fcd.firebaseapp.com',
    storageBucket: 'my-app-72fcd.firebasestorage.app',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBWo-nu7x35VfIrf55C2SnCGoEuXKvLs2w',
    appId: '1:967610623318:ios:b355e60aa4f07e6e0322f7',
    messagingSenderId: '967610623318',
    projectId: 'my-app-72fcd',
    storageBucket: 'my-app-72fcd.firebasestorage.app',
    iosBundleId: 'com.example.tmdtApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCgkx0zDap_611HHvisicWaRU0ATuzhRH4',
    appId: '1:967610623318:web:12c5eb7278d9f1c50322f7',
    messagingSenderId: '967610623318',
    projectId: 'my-app-72fcd',
    authDomain: 'my-app-72fcd.firebaseapp.com',
    storageBucket: 'my-app-72fcd.firebasestorage.app',
  );
}
