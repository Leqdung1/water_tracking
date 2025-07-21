import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:water_tracking/core/extensions/theme_extension.dart';
import 'package:water_tracking/core/style/text_style.dart';

import '../../core/constants/app_theme_const.dart';
import '../../i18n/strings.g.dart';
import '../button/app_button.dart';

class AppBottomSheet extends StatelessWidget {
  final String title;
  final Widget widget;
  final VoidCallback onCancel;
  final VoidCallback onSave;
  final String? cancelText;
  final String? saveText;
  const AppBottomSheet(
      {super.key,
      required this.title,
      required this.widget,
      required this.onCancel,
      required this.onSave,
      this.cancelText,
      this.saveText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppThemeConst.neutralColor3,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ------------------------------------ Header ------------------------------------ //
          Gap(16),
          Container(
            height: 3,
            width: 40,
            decoration: BoxDecoration(
              color: AppThemeConst.neutralColor.withOpacity(0.5),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          Gap(16),
          Text(
            title,
            style: context.textTheme.body22.copyWith(
              color: AppThemeConst.neutralColor1,
            ),
          ),
          Gap(
            16,
          ),
          Divider(
            thickness: 0.7,
            color: AppThemeConst.neutralColor,
          ),
          // ------------------------------------ Body ------------------------------------ //
          Gap(16),
          widget,
          Gap(16),

          Divider(
            thickness: 0.7,
            color: AppThemeConst.neutralColor,
          ),
          Gap(32),
          // ------------------------------------ Button ------------------------------------ //
          SafeArea(
            child: Row(
              children: [
                Expanded(
                  child: AppButton(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    margin: EdgeInsets.zero,
                    color: AppThemeConst.primaryColor.withOpacity(0.18),
                    onTap: onCancel ,
                    title: cancelText ?? t.core.cancel,
                    textColor: AppThemeConst.primaryColor,
                  ),
                ),
                Gap(16),
                Expanded(
                  child: AppButton(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    margin: EdgeInsets.zero,
                    onTap: onSave,
                    title: saveText ?? t.core.save,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
