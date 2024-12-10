import 'package:ex_app/core/language/app_localizations.dart';
import 'package:ex_app/core/style/theme/assets_extension.dart';
import 'package:ex_app/core/style/theme/color_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension ContextExt on BuildContext {


// Colors
  MyColors get color => Theme.of(this).extension<MyColors>()!;

  // Images
  MyAssets get assets => Theme.of(this).extension<MyAssets>()!;

  String translate(String langKey){
    return AppLocalizations.of(this)!.translate(langKey).toString();
  }

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
