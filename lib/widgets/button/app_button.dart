import 'package:flutter/material.dart';
import 'package:water_tracking/core/extensions/theme_extension.dart';
import 'package:water_tracking/core/style/text_style.dart';

import '../../core/constants/app_theme_const.dart';

class AppButton extends StatelessWidget {
  final Color? color;
  final String? title;
  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final double? borderRadius;
  final Color? textColor;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  const AppButton({
    super.key,
    this.color,
    this.title,
    this.onTap,
    this.width,
    this.height,
    this.borderRadius,
    this.textColor,
    this.padding,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      padding: padding ?? EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color ?? AppThemeConst.primaryColor,
        borderRadius: BorderRadius.circular(borderRadius ?? 100),
      ),
      alignment: Alignment.center,
      child: Text(
        title ?? '',
        style: context.textTheme.body17.copyWith(
          color: textColor ?? AppThemeConst.neutralColor,
        ),
      ),
    );
  }
}
