import 'package:ex_app/core/app/app_cubit/app_cubit.dart';
import 'package:ex_app/core/app/connectivity_controller.dart';
import 'package:ex_app/core/common/screens/no_network_screen.dart';
import 'package:ex_app/core/extensions/context_extension.dart';
import 'package:ex_app/core/language/app_localizations_setup.dart';
import 'package:ex_app/core/routes/app_routes.dart';
import 'package:ex_app/core/service/shared_pref/pref_keys.dart';
import 'package:ex_app/core/style/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'core/di/injection_container.dart';
import 'core/service/shared_pref/shared_pref.dart';

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ConnectivityController.instance.isConnected,
      builder: (_, value, __) {
        if (value) {
          return BlocProvider(
            create: (context) => sl<AppCubit>()
              ..changeAppThemeMode(
                sharedMode: SharedPref().getBoolean(PrefKeys.themeMode),
              )
              ..getSavedLanguage(),
            child: ScreenUtilInit(
              child: BlocBuilder<AppCubit, AppState>(
                buildWhen: (prev, next) => prev != next,
                builder: (context, state) {
                  final cubit = context.read<AppCubit>();
                  return MaterialApp(
                    locale: Locale(cubit.currentLangCode),
                    supportedLocales: AppLocalizationsSetup.supportedLocales,
                    onGenerateRoute: AppRoutes.onGenerateRoute,
                    initialRoute: SharedPref()
                                .getString(PrefKeys.accessToken) !=
                            null
                        ? SharedPref().getString(PrefKeys.userRole) != 'admin'
                            ? AppRoutes.homeAdmin
                            : AppRoutes.homeCustomer
                        : AppRoutes.login,
                    localeResolutionCallback:
                        AppLocalizationsSetup.localeResolutionCallback,
                    localizationsDelegates:
                        AppLocalizationsSetup.localizationsDelegates,
                    theme: cubit.isDark ? themeDark() : themeLight(),
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
                  );
                },
              ),
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
