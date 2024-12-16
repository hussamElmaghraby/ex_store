import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:ex_app/core/app/env.variable.dart';
import 'package:ex_app/core/servcie/shared_pref/shared_pref.dart';
import 'package:ex_app/store_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'core/app/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //initialize
  await EnvVariable.instance.init(envType: EnvTypeEnum.DEV);
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
            apiKey: 'AIzaSyA7SyBSUemF8lmfl7r0EnIAoLNmGYQWwTg',
            appId: '1:831702218078:android:dfe935c9cd4825d23ecbcf',
            messagingSenderId: '831702218078',
            projectId: 'exstore-59959',
          ),
        )
      : await Firebase.initializeApp();

  await SharedPref().instantiatePreferences();
  Bloc.observer = AppBlocObserver();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp, // Add more orientations as needed
  ]).then((_) {
    runApp(const StoreApp());
  });
}
