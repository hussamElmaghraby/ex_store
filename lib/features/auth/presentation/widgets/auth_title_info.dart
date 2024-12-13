import 'package:ex_app/core/common/widgets/custom_linear_button.dart';
import 'package:ex_app/core/common/widgets/text_app.dart';
import 'package:ex_app/core/extensions/context_extension.dart';
import 'package:ex_app/core/style/fonts/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthTitleInfo extends StatelessWidget {
  const AuthTitleInfo(
      {required this.title, required this.description, super.key});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextApp(
          text: title,
          theme: context.textStyle.copyWith(
            fontSize: 24.sp,
            color: context.color.textColor,
            fontWeight: FontWeightHelper.medium,
          ),
        ),
        SizedBox(height: 24.h),
        TextApp(
          text: description,
          theme: context.textStyle.copyWith(
            fontSize: 24.sp,
            color: context.color.textColor,
            fontWeight: FontWeightHelper.medium,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
