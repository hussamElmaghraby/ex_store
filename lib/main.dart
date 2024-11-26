import 'dart:io';

import 'package:ex_app/store_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isAndroid) {
    // messagingSenderId : project_number
    // apiKey: current_key
    // appId: mobilesdk_app_id
    // projectId: projectId
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: 'AIzaSyA7SyBSUemF8lmfl7r0EnIAoLNmGYQWwTg',
            appId: '1:831702218078:android:dfe935c9cd4825d23ecbcf',
            messagingSenderId: '831702218078',
            projectId: 'exstore-59959'));
  }

  runApp(const StoreApp());
}
