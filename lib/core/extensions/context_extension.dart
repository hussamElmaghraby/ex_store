import 'package:ex_app/core/style/theme/color_extension.dart';
import 'package:ex_app/core/style/theme/image_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension ContextExt on BuildContext {



  MyColors get color => Theme.of(this).extension<MyColors>()!;

  MyImages get assets => Theme.of(this).extension<MyImages>()!;

  Future<Object?> pushNamed(
    String routeName, {
    Object? arguments,
  }) async {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<Object?> pushReplacementNamed(
    String routeName, {
    Object? arguments,
  }) async {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<Object?> pushAndRemoveUntil(
    String routeName,
  ) async {
    return Navigator.of(this).pushNamedAndRemoveUntil(
      routeName,
      (_) => false,
    );
  }

  void pop() => Navigator.of(this).pop();
}
