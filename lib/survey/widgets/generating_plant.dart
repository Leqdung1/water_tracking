import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:water_tracking/core/extensions/theme_extension.dart';
import 'package:water_tracking/core/style/text_style.dart';

import '../../core/constants/app_theme_const.dart';
import '../../i18n/strings.g.dart';

class GeneratingPlant extends StatelessWidget {
  const GeneratingPlant({super.key});

  @override
  Widget build(BuildContext context) {
    final Random random = Random();
    final value = random.nextInt(100);
    return Scaffold(
      backgroundColor: AppThemeConst.neutralColor3,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                t.core.generating_personalized_hydration_plan_for_you,
                style: context.textTheme.largeTitle2.copyWith(
                  color: AppThemeConst.neutralColor1,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Gap(16),
            Text(
              t.core.please_wait,
              style: context.textTheme.body17.copyWith(
                color: AppThemeConst.neutralColor2,
              ),
            ),
            const Gap(80),
            SizedBox.square(
              dimension: 300,
              child: Stack(
                children: [
                  SizedBox(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: CircularProgressIndicator(
                        strokeWidth: 30,
                        strokeAlign: BorderSide.strokeAlignInside,
                        strokeCap: StrokeCap.round,
                        value: value / 100,
                        backgroundColor:
                            AppThemeConst.neutralColor2.withOpacity(0.2),
                        color: AppThemeConst.primaryColor,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Center(
                      child: Text(
                        "$value%",
                        style: context.textTheme.largeTitle.copyWith(
                          color: AppThemeConst.neutralColor1,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Spacer(),
            Text(
              t.core
                  .this_will_just_take_a_moment_get_ready_to_transform_your_hidration_journey,
              style: context.textTheme.body17.copyWith(
                color: AppThemeConst.neutralColor2,
              ),
              textAlign: TextAlign.center,
            ),
            const Gap(40),
          ],
        ),
      ),
    );
  }
}
