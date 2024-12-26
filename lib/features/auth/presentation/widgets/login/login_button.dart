import 'package:ex_app/core/common/animations/animate_do.dart';
import 'package:ex_app/core/common/toast/show_toast.dart';
import 'package:ex_app/core/common/widgets/custom_linear_button.dart';
import 'package:ex_app/core/common/widgets/text_app.dart';
import 'package:ex_app/core/extensions/context_extension.dart';
import 'package:ex_app/core/language/lang_keys.dart';
import 'package:ex_app/core/routes/app_routes.dart';
import 'package:ex_app/core/style/fonts/font_weight_helper.dart';
import 'package:ex_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeInRight(
      duration: 400,
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          state.whenOrNull(success: (userRole) {
            ShowToast.showToastSuccessTop(
                context: context, message: LangKeys.loggedSuccessfully);
            if (userRole == 'admin') {
              context.pushNamedAndRemoveUntil(
                AppRoutes.homeAdmin,
              );
            }else {
              context.pushNamedAndRemoveUntil(
                AppRoutes.homeCustomer,
              );
            }
          }, error: (errorMessage) {
            ShowToast.showToastErrorTop(
              context: context,
              message: context.translate(errorMessage),
            );
          });
        },
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => CustomLinearButton(
                width: MediaQuery.of(context).size.width,
                onPressed: () {},
                child: const CircularProgressIndicator(
                  color: Colors.white,
                )),
            orElse: () => CustomLinearButton(
              width: MediaQuery.of(context).size.width,
              onPressed: () {
                _validateBeforeLogin(context);
              },
              child: TextApp(
                text: context.translate(LangKeys.login),
                theme: context.textStyle.copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeightHelper.bold,
                  color: Colors.white,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _validateBeforeLogin(BuildContext context) {
    if (context.read<AuthBloc>().formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(const AuthEvent.login());
    }
  }
}
