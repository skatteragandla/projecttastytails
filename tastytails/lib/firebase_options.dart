//firebase_options.dart
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBokmslBbZuCmX3xQoMjDWOAei8gaEnG48',
    appId: '1:894196195572:web:41da8612e53f9cc37afea1',
    messagingSenderId: '894196195572',
    projectId: 'tastytrailsproject',
    authDomain: 'tastytrailsproject.firebaseapp.com',
    storageBucket: 'tastytrailsproject.appspot.com',
    measurementId: 'G-FV9918JFHZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAn60F0ANIsr7mfIZRtZf9uvqwW_7ODXTA',
    appId: '1:894196195572:android:3ccc8709fdc2c4d47afea1',
    messagingSenderId: '894196195572',
    projectId: 'tastytrailsproject',
    storageBucket: 'tastytrailsproject.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCMYmrmSl35eGIJfeLbKQe_YLiGs44dqVM',
    appId: '1:894196195572:ios:0f74d38a8b394be17afea1',
    messagingSenderId: '894196195572',
    projectId: 'tastytrailsproject',
    storageBucket: 'tastytrailsproject.appspot.com',
    iosBundleId: 'com.example.tastytails',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCMYmrmSl35eGIJfeLbKQe_YLiGs44dqVM',
    appId: '1:894196195572:ios:0f74d38a8b394be17afea1',
    messagingSenderId: '894196195572',
    projectId: 'tastytrailsproject',
    storageBucket: 'tastytrailsproject.appspot.com',
    iosBundleId: 'com.example.tastytails',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBokmslBbZuCmX3xQoMjDWOAei8gaEnG48',
    appId: '1:894196195572:web:4ee7862b0c7826f37afea1',
    messagingSenderId: '894196195572',
    projectId: 'tastytrailsproject',
    authDomain: 'tastytrailsproject.firebaseapp.com',
    storageBucket: 'tastytrailsproject.appspot.com',
    measurementId: 'G-25LDDXRHEN',
  );
}
