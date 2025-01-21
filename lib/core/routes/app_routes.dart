import 'package:ex_app/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:ex_app/core/di/injection_container.dart';
import 'package:ex_app/core/routes/base_routes.dart';
import 'package:ex_app/features/admin/presentation/screens/home_admin_screen.dart';
import 'package:ex_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ex_app/features/auth/presentation/screens/login_screen.dart';
import 'package:ex_app/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:ex_app/features/customer/home_customer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoutes {
  static const String login = '/login';
  static const String signUp = '/signUp';
  static const String homeAdmin = '/homeAdmin';
  static const String homeCustomer = '/customerAdmin';

  static Route<void> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case login:
        return BaseRoute(
            page: BlocProvider<AuthBloc>(
          create: (_) => sl<AuthBloc>(),
          child: const LoginScreen(),
        ));

      case signUp:
        return BaseRoute(
          page: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => sl<UploadImageCubit>(),
              ),
              BlocProvider(
                create: (_) => sl<AuthBloc>(),
              ),
            ],
            child: const SignupScreen(),
          ),
        );
      case homeAdmin:
        return BaseRoute(page: const HomeAdminScreen());
      case homeCustomer:
        return BaseRoute(page: const HomeCustomerScreen());

      default:
        return BaseRoute(page: const SizedBox());
    }
  }
}
