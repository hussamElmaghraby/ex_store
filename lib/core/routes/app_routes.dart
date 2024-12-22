import 'package:ex_app/core/di/injection_container.dart';
import 'package:ex_app/core/routes/base_routes.dart';
import 'package:ex_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ex_app/features/auth/presentation/screens/login_screen.dart';
import 'package:ex_app/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoutes {
  static const String login = '/login';
  static const String signUp = '/signUp';
  static const String home = '/home';

  static Route<void> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case login:
        return BaseRoute(
            page: BlocProvider<AuthBloc>(
          create: (_) => sl<AuthBloc>(),
          child: LoginScreen(),
        ));

      case signUp:
        return BaseRoute(page: const SignupScreen());

      default:
        return BaseRoute(page: const SizedBox());
    }
  }
}
