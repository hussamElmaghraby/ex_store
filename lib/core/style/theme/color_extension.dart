import 'package:ex_app/core/style/colors/colors_dark.dart';
import 'package:ex_app/core/style/colors/colors_light.dart';
import 'package:ex_app/main.dart';
import 'package:flutter/material.dart';

class MyColors implements ThemeExtension<MyColors> {
  const MyColors({required this.mainColor});

  final Color? mainColor;

  @override
  ThemeExtension<MyColors> copyWith({Color? mainColor}) {
    return MyColors(
      mainColor: mainColor,
    );
  }

  @override
  ThemeExtension<MyColors> lerp(
      covariant ThemeExtension<MyColors>? other, double t) {
    if (other is! MyColors) {
      return this;
    }
    return MyColors(
      mainColor: mainColor,
    );
  }

  @override
  Object get type => MyColors(mainColor: mainColor);


  static const MyColors dark =  MyColors(mainColor: ColorsDark.mainColor);
  static const MyColors light = MyColors(mainColor: ColorsLight.mainColor);

}