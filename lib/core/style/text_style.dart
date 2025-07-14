import 'package:flutter/material.dart';

import '../constants/app_theme_const.dart';

extension TextThemeExt on TextTheme {
  String get _fontFamily => 'Comic Neue';

  TextStyle get largeTitle => TextStyle(
        fontSize: 42,
        fontWeight: FontWeight.bold,
        fontFamily: _fontFamily,
        color: AppThemeConst.neutralColor1,
      );

  TextStyle get bodySmall => TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.normal,
        fontFamily: _fontFamily,
        color: AppThemeConst.neutralColor1,
      );

  TextStyle get body17 => TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w700,
        fontFamily: _fontFamily,
        color: AppThemeConst.neutralColor1,
      );

  TextStyle get titleAppBar => TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w700,
        fontFamily: _fontFamily,
        color: AppThemeConst.neutralColor1,
      );

  TextStyle get body12 => TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        fontFamily: _fontFamily,
        color: AppThemeConst.neutralColor1,
      );

  TextStyle get body15 => TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        fontFamily: _fontFamily,
        color: AppThemeConst.neutralColor1,
      );

  TextStyle get body22 => TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        fontFamily: _fontFamily,
        color: AppThemeConst.neutralColor1,
      );

  TextStyle get dateTime => TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      fontFamily: _fontFamily,
      color: AppThemeConst.neutralColor1);
}
