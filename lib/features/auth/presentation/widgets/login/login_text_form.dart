import 'package:ex_app/core/app/bloc_observer.dart';
import 'package:ex_app/core/common/animations/animate_do.dart';
import 'package:ex_app/core/common/widgets/custom_linear_button.dart';
import 'package:ex_app/core/common/widgets/custom_text_field.dart';
import 'package:ex_app/core/extensions/context_extension.dart';
import 'package:ex_app/core/language/lang_keys.dart';
import 'package:ex_app/core/utils/app_regex.dart';
import 'package:ex_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginTextForm extends StatefulWidget {
  const LoginTextForm({super.key});

  @override
  State<LoginTextForm> createState() => _LoginTextFormState();
}

class _LoginTextFormState extends State<LoginTextForm> {
  bool isShowPassword = false;
  late AuthBloc _bloc;

  @override
  void initState() {
    _bloc  = context.read<AuthBloc>();
    super.initState();
  }


  @override
  void dispose() {
    _bloc.emailController.dispose();
    _bloc.passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _bloc.formKey,
      child: Column(
        children: [
          // Email
          CustomFadeInRight(
            duration: 200,
            child: CustomTextField(
              controller: _bloc.emailController,
              hintText: context.translate(
                LangKeys.email,
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (!AppRegex.isEmailValid(value!)) {
                  return context.translate(LangKeys.validEmail);
                }
                return null;
              },
            ),
          ),
          SizedBox(
            height: 24.sp,
          ),
          // Password
          CustomFadeInRight(
            duration: 200,
            child: CustomTextField(
              controller: _bloc.passwordController,
              hintText: context.translate(
                LangKeys.password,
              ),
              keyboardType: TextInputType.visiblePassword,
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 6) {
                  return context.translate(LangKeys.validPasswrod);
                }
                return null;
              },
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isShowPassword = !isShowPassword;
                  });
                },
                icon: Icon(
                  color: Colors.white,
                  isShowPassword ? Icons.visibility_off : Icons.visibility,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
