import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:water_tracking/core/extensions/theme_extension.dart';
import 'package:water_tracking/core/style/text_style.dart';

import '../../core/constants/app_theme_const.dart';
import '../../core/enum/app_enum.dart';

class WaterGoalDisplay extends StatelessWidget {
  final double waterGoal;
  final WaterUnit selectedUnit;

  const WaterGoalDisplay({
    super.key,
    required this.waterGoal,
    required this.selectedUnit,
  });

  String _getCupImagePath(double goalMl) {
    final primaryCup = CupSize.getPrimaryCup(goalMl);
    return primaryCup.imagePath;
  }

  @override
  Widget build(BuildContext context) {
    final displayValue =
        selectedUnit == WaterUnit.l ? waterGoal / 1000 : waterGoal;
    final displayText = displayValue.toInt().toString();

    return Column(
      children: [
        // Water Glass - Dynamic based on goal
        Image.asset(
          _getCupImagePath(waterGoal),
          width: 120,
          height: 160,
          fit: BoxFit.cover,
        ),
        const Gap(32),

        // Current Goal Display
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              displayText,
              style: context.textTheme.largeTitle.copyWith(
                color: AppThemeConst.neutralColor1,
                fontSize: 48,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Gap(8),
            Text(
              selectedUnit.name,
              style: context.textTheme.body17.copyWith(
                color: AppThemeConst.neutralColor2,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
