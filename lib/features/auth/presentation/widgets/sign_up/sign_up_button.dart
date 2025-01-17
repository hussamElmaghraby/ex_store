import 'package:ex_app/core/app/upload_image/cubit/upload_image_cubit.dart';
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

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        state.whenOrNull(success: (_) {
          ShowToast.showToastSuccessTop(
            context: context,
            message: LangKeys.loggedSuccessfully,
          );
          context.pushNamedAndRemoveUntil(AppRoutes.homeCustomer);
        } ,error:  (error){
          ShowToast.showToastErrorTop(
            context: context,
            message: error,
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
          orElse: () => CustomFadeInRight(
            duration: 400,
            child: CustomLinearButton(
              width: MediaQuery.of(context).size.width,
              onPressed: () {
                _validateBeforeSignUp(context);
              },
              child: TextApp(
                text: context.translate(LangKeys.signUp),
                theme: context.textStyle.copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeightHelper.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _validateBeforeSignUp(BuildContext context) {
    final authBloc = context.read<AuthBloc>();
    final imageCubit = context.read<UploadImageCubit>();
    if (authBloc.formKey.currentState!.validate() ||
        imageCubit.getImageUrl.isEmpty) {
      if (imageCubit.getImageUrl.isEmpty) {
        ShowToast.showToastErrorTop(
          context: context,
          message: context.translate(
            LangKeys.validPickImage,
          ),
        );
      }
      context.read<AuthBloc>().add(AuthEvent.signup(imageCubit.getImageUrl));
    }
  }
}
