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

class SignUpTextForm extends StatefulWidget {
  const SignUpTextForm({super.key});

  @override
  State<SignUpTextForm> createState() => _SignUpTextFormState();
}

class _SignUpTextFormState extends State<SignUpTextForm> {
  bool isShowPassword = false;

  late final AuthBloc _bloc;

  @override
  void initState() {
    _bloc = context.read<AuthBloc>();
    super.initState();
  }

  @override
  void dispose() {
    _bloc.emailController.dispose();
    _bloc.nameController.dispose();
    _bloc.passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _bloc.formKey,
      child: Column(
        children: [
          CustomFadeInRight(
            duration: 200,
            child: CustomTextField(
              controller: _bloc.nameController,
              hintText: context.translate(
                LangKeys.fullName,
              ),
              keyboardType: TextInputType.visiblePassword,
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 4) {
                  return context.translate(LangKeys.validName);
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
          SizedBox(
            height: 24.sp,
          ),
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
                  isShowPassword ? Icons.visibility_off : Icons.visibility,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
