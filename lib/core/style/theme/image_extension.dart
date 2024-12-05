import 'package:ex_app/core/style/colors/colors_dark.dart';
import 'package:ex_app/core/style/colors/colors_light.dart';
import 'package:ex_app/core/style/images/app_images.dart';
import 'package:ex_app/main.dart';
import 'package:flutter/material.dart';

class MyImages implements ThemeExtension<MyImages> {
  const MyImages({required this.testImage});

  final String? testImage;

  @override
  ThemeExtension<MyImages> copyWith({String? testImage}) {
    return MyImages(
      testImage: testImage,
    );
  }

  @override
  ThemeExtension<MyImages> lerp(
      covariant ThemeExtension<MyImages>? other, double t) {
    if (other is! MyImages) {
      return this;
    }
    return MyImages(
      testImage: testImage,
    );
  }

  @override
  Object get type => MyImages(testImage: testImage);


  static const MyImages dark =  MyImages(testImage: AppImages.darkTestImage);
  static const MyImages light = MyImages(testImage: AppImages.lightTestImage);

}
