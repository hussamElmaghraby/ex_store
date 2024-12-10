import 'package:ex_app/core/style/colors/colors_dark.dart';
import 'package:ex_app/core/style/colors/colors_light.dart';
import 'package:ex_app/core/style/theme/color_extension.dart';
import 'package:flutter/material.dart';

import 'assets_extension.dart';

ThemeData themeDark() {
  return ThemeData(
      scaffoldBackgroundColor: ColorsDark.mainColor,
      extensions: const <ThemeExtension<dynamic>>[MyColors.dark , MyAssets.dark],
      useMaterial3: true);
}

ThemeData themeLight() {
  return ThemeData(
    scaffoldBackgroundColor: ColorsLight.mainColor,
    extensions: const <ThemeExtension<dynamic>>[MyColors.light , MyAssets.light],
    useMaterial3: true,
  );
}
