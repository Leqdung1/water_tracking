import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:water_tracking/core/extensions/theme_extension.dart';
import 'package:water_tracking/core/style/text_style.dart';

import '../../core/constants/app_theme_const.dart';
import '../../i18n/strings.g.dart';
import '../../widgets/button/app_button.dart';

class StepWidget extends StatelessWidget {
  final String title;
  final String description;
  final Widget child;
  final VoidCallback onPressed;
  final bool isEnabled;
  const StepWidget({
    super.key,
    required this.title,
    required this.description,
    required this.child,
    required this.onPressed,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: context.textTheme.titleAppBar.copyWith(
                  color: AppThemeConst.neutralColor1,
                ),
              ),
              Gap(16),
              Text(
                description,
                style: context.textTheme.body17.copyWith(
                  color: AppThemeConst.neutralColor2,
                ),
                textAlign: TextAlign.center,
              ),
              Gap(16),
              child,
            ],
          ),
        ),
        SafeArea(
          child: AppButton(
            onTap: onPressed,
            title: t.core.continue_text,
            isEnabled: isEnabled,
          ),
        ),
      ],
    );
  }
}
