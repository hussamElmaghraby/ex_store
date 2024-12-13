import 'package:ex_app/core/common/animations/animate_do.dart';
import 'package:ex_app/core/common/widgets/custom_linear_button.dart';
import 'package:ex_app/core/common/widgets/text_app.dart';
import 'package:ex_app/core/extensions/context_extension.dart';
import 'package:ex_app/core/language/lang_keys.dart';
import 'package:ex_app/core/style/fonts/font_weight_helper.dart';
import 'package:ex_app/features/auth/presentation/widgets/auth_title_info.dart';
import 'package:ex_app/features/auth/presentation/widgets/dark_and_lang_buttons.dart';
import 'package:ex_app/features/auth/presentation/widgets/login/login_button.dart';
import 'package:ex_app/features/auth/presentation/widgets/login/login_text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 20.h,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            //Dark mode and language
            const DarkAndLangButtons(),
            SizedBox(height: 50.h),
            AuthTitleInfo(
                title: context.translate(
                  LangKeys.language,
                ),
                description: context.translate(
                  LangKeys.welcome,
                )),
            SizedBox(height: 30.h),
            // Login Text Field
            LoginTextForm(),
            SizedBox(height: 30.h),
            // Login Button
            LoginButton(),
            SizedBox(height: 30.h),
            // Go to Sign Up Screen
            CustomFadeInDown(
              duration: 400,
              child: TextApp(
                text: context.translate(LangKeys.createAccount),
                theme: context.textStyle.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeightHelper.bold,
                    color: context.color.bluePinkLight),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
