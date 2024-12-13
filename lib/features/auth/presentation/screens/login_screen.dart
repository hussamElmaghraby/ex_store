import 'package:ex_app/core/common/widgets/custom_linear_button.dart';
import 'package:ex_app/core/extensions/context_extension.dart';
import 'package:ex_app/features/auth/presentation/refactors/auth_custom_painter.dart';
import 'package:ex_app/features/auth/presentation/refactors/login_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomPaint(
        size: Size(
          MediaQuery.of(context).size.width,
          120.h,
        ),
        painter: AuthCustomPainter(
          gradient: LinearGradient(
            colors: [
              context.color.bluePinkLight!,
              context.color.bluePinkLight!,
              context.color.bluePinkDark!,
              context.color.bluePinkDark!,
            ],
          ),
        ),
      ),
      body: const SafeArea(
        bottom: false,
        child: LoginBody(),
      ),
    );
  }
}
