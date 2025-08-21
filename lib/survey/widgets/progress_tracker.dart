import 'package:flutter/material.dart';

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
    return SizedBox(
      width: 200,
      height: 8,
      child: Row(
        children: [
          Stack(
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
         
        ],
      ),
    );
  }
}
