import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:water_tracking/core/extensions/theme_extension.dart';
import 'package:water_tracking/core/style/text_style.dart';
import 'package:water_tracking/survey/cubit/survey_cubit.dart';
import 'package:water_tracking/widgets/button/app_button.dart';

import '../core/constants/app_theme_const.dart';
import '../core/enum/app_enum.dart';
import '../i18n/strings.g.dart';
import '../screens/main/main_screen.dart';
import 'widgets/adjust_button.dart';
import 'widgets/water_goal_display.dart';
import 'widgets/water_unit_selector.dart';

class SurveyResultScreen extends StatefulWidget {
  const SurveyResultScreen({super.key});

  @override
  State<SurveyResultScreen> createState() => _SurveyResultScreenState();
}

class _SurveyResultScreenState extends State<SurveyResultScreen> {
  final ValueNotifier<WaterUnit> selectedUnit = ValueNotifier(WaterUnit.ml);
  late final ValueNotifier<double> waterGoal;
  late final SurveyCubit surveyCubit;

  @override
  void initState() {
    super.initState();
    _initWaterGoal();
    surveyCubit = context.read<SurveyCubit>();
  }

  void _initWaterGoal() {
    waterGoal =
        ValueNotifier((Random().nextDouble() * 10000).clamp(1000, 10000));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurveyCubit, SurveyState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppThemeConst.neutralColor3,
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const Gap(24),
                      // Title
                      Text(
                        t.core.your_daily_goal_is,
                        style: context.textTheme.largeTitle.copyWith(
                          color: AppThemeConst.neutralColor1,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Gap(32),

                      // Unit Selection Bar
                      ValueListenableBuilder(
                        valueListenable: selectedUnit,
                        builder: (context, unit, child) {
                          return WaterUnitSelector(
                            selectedUnit: unit,
                            onUnitChanged: (newUnit) {
                              selectedUnit.value = newUnit;
                            },
                          );
                        },
                      ),
                      const Gap(48),

                      // Water Goal Display
                      ValueListenableBuilder(
                        valueListenable: waterGoal,
                        builder: (context, goal, child) {
                          return ValueListenableBuilder(
                            valueListenable: selectedUnit,
                            builder: (context, unit, child) {
                              return WaterGoalDisplay(
                                waterGoal: goal,
                                selectedUnit: unit,
                              );
                            },
                          );
                        },
                      ),

                      // Adjust Button
                      AdjustButton(
                        onTap: () {
                          // Handle adjust action
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 16),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: AppThemeConst.neutralColor2.withOpacity(0.2),
                      ),
                    ),
                  ),
                  child: AppButton(
                    onTap: () async {
                      await surveyCubit.saveWater(waterGoal.value);
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainScreen(),
                        ),
                        (route) => false,
                      );
                    },
                    title: t.core.lets_hydrate,
                    isEnabled: true,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
