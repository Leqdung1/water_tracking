import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:water_tracking/core/extensions/theme_extension.dart';
import 'package:water_tracking/core/style/text_style.dart';
import 'package:water_tracking/survey/widgets/step_widget.dart';

import '../../core/constants/app_theme_const.dart';
import '../../core/enum/app_enum.dart';
import '../../i18n/strings.g.dart';
import '../cubit/survey_cubit.dart';

class StepActivityLevel extends StatefulWidget {
  const StepActivityLevel({super.key});

  @override
  State<StepActivityLevel> createState() => _StepActivityLevelState();
}

class _StepActivityLevelState extends State<StepActivityLevel> {
  final ValueNotifier<ActivityLevel?> selectedActivityLevel =
      ValueNotifier(null);

  @override
  void initState() {
    super.initState();
    selectedActivityLevel.value =
        context.read<SurveyCubit>().state.userInfo?.activityLevel;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurveyCubit, SurveyState>(
      builder: (context, state) {
        final cubit = context.read<SurveyCubit>();

        return ValueListenableBuilder(
          valueListenable: selectedActivityLevel,
          builder: (context, value, child) {
            return StepWidget(
              isEnabled: value != null,
              title: t.core.what_your_activity_level,
              description: t.core
                  .understanding_your_activity_is_vital_for_crafting_a_personalized_hydration_plan_pick_the_option_that_best_describes_your_typical_activity_level,
              isCenter: true,
              child: _buildActivityLevelPicker(context, value),
              onPressed: () {
                if (value != null) {
                  cubit.updateActivityLevel(value);
                  cubit.nextStep();
                }
              },
            );
          },
        );
      },
    );
  }

  Widget _buildActivityLevelPicker(
      BuildContext context, ActivityLevel? selectedLevel) {
    return SingleChildScrollView(
      child: Column(
        children: ActivityLevel.values.map((activityLevel) {
          final isSelected = selectedLevel == activityLevel;

          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: GestureDetector(
              onTap: () => selectedActivityLevel.value = activityLevel,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected
                        ? AppThemeConst.primaryColor
                        : AppThemeConst.neutralColor2.withOpacity(0.2),
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    // Icon
                    Image.asset(
                      activityLevel.imagePath,
                      width: 40,
                      height: 40,
                      fit: BoxFit.contain,
                    ),
                    const Gap(16),
                    // Content
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            activityLevel.name,
                            style: context.textTheme.body17.copyWith(
                              color: AppThemeConst.neutralColor1,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Gap(4),
                          Text(
                            activityLevel.description,
                            style: context.textTheme.body15.copyWith(
                              color: AppThemeConst.neutralColor2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
