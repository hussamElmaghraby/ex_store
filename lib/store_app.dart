import 'package:ex_app/core/app/connectivity_controller.dart';
import 'package:ex_app/core/common/screens/no_network_screen.dart';
import 'package:ex_app/core/extensions/context_extension.dart';
import 'package:ex_app/core/language/app_localizations_setup.dart';
import 'package:ex_app/core/style/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'core/style/fonts/font_family_helper.dart';
import 'core/style/fonts/font_weight_helper.dart';

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ConnectivityController.instance.isConnected,
      builder: (_, value, __) {
        if (value) {
          return ScreenUtilInit(
            child: MaterialApp(
              locale: const Locale('en'),
              supportedLocales: AppLocalizationsSetup.supportedLocales,
              localeResolutionCallback:
                  AppLocalizationsSetup.localeResolutionCallback,
              localizationsDelegates:
                  AppLocalizationsSetup.localizationsDelegates,
              theme: themeDark(),
              home: Scaffold(
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('test'),
                       Text(
                        context.translate('test'),
                        style: TextStyle(
                          fontFamily: FontFamilyHelper.poppinsEnglish,
                          fontWeight: FontWeightHelper.bold,
                        ),
                      ),
                      // Image.asset(context.assets.testImage ?? 'test')
                    ],
                  ),
                ),
              ),
              builder: (_, widget) {
                return GestureDetector(
                  onTap: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: Scaffold(
                    body: Builder(builder: (_) {
                      ConnectivityController.instance.init();
                      return widget!;
                    }),
                  ),
                );
              },
            ),
          );
        } else {
          return MaterialApp(
            theme: ThemeData(),
            home: const NoNetworkScreen(),
          );
        }
      },
    );
  }
}
