import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:water_tracking/core/extensions/theme_extension.dart';
import 'package:water_tracking/core/style/text_style.dart';

import '../../core/constants/app_theme_const.dart';

class StepProgressTracker extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const StepProgressTracker({
    super.key,
    required this.currentStep,
    required this.totalSteps,
  });

  @override
  Widget build(BuildContext context) {
    double progress = currentStep / totalSteps;
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            width: 200,
            height: 8,
            child: Stack(
              children: [
                Container(
                  width: 200,
                  height: 8,
                  decoration: BoxDecoration(
                    color: AppThemeConst.primaryColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: progress,
                  child: Container(
                    height: 8,
                    decoration: BoxDecoration(
                      color: AppThemeConst.primaryColor,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Gap(32),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '$currentStep',
                style: context.textTheme.body17.copyWith(
                  color: AppThemeConst.neutralColor1,
                ),
              ),
              TextSpan(
                text: ' / $totalSteps',
                style: context.textTheme.body17.copyWith(
                  color: AppThemeConst.neutralColor1,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
