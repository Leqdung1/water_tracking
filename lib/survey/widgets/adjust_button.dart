import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:water_tracking/core/extensions/theme_extension.dart';
import 'package:water_tracking/core/style/text_style.dart';

import '../../core/constants/app_theme_const.dart';
import '../../i18n/strings.g.dart';

class AdjustButton extends StatelessWidget {
  final VoidCallback onTap;

  const AdjustButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(120),
          border: Border.all(
            color: AppThemeConst.neutralColor2.withOpacity(0.3),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.edit_outlined,
              size: 20,
              color: AppThemeConst.neutralColor1,
            ),
            const Gap(8),
            Text(
              t.core.adjust,
              style: context.textTheme.body17.copyWith(
                color: AppThemeConst.neutralColor1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
