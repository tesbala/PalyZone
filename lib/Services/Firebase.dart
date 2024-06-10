// ignore: file_names
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class FirebaseService {
  const FirebaseService._();
  static FirebaseOptions get option {
    // if (kIsWeb) {
    //   return _web;
    // }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return _android;
      default:
        throw UnsupportedError(
          'FirebaseInfo are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions _android = FirebaseOptions(
    apiKey: 'AIzaSyAKxBage-UcsojDF9Dm4KHEPaClespZCRk',
    appId: '1:695193482424:android:007156cd315e7c20b0704d',
    messagingSenderId: '695193482424',
    projectId: 'playzone-b4241',
    storageBucket: 'playzone-b4241.appspot.com',
  );
}
