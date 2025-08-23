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

class StepGender extends StatefulWidget {
  const StepGender({super.key});

  @override
  State<StepGender> createState() => _StepGenderState();
}

class _StepGenderState extends State<StepGender> {
  final ValueNotifier<Gender?> selectedGender = ValueNotifier(null);

  @override
  void initState() {
    super.initState();
    selectedGender.value = context.read<SurveyCubit>().state.userInfo?.gender;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurveyCubit, SurveyState>(
      builder: (context, state) {
        final cubit = context.read<SurveyCubit>();

        return ValueListenableBuilder(
          valueListenable: selectedGender,
          builder: (context, value, child) {
            return StepWidget(
              isEnabled: value != null,
              title: t.core.what_is_your_gender,
              description:
                  t.core.hydrify_is_here_to_tailor_a_hydration_plan_just_for_you,
              isCenter: true,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildGenderItem(context,
                          gender: Gender.male,
                          isSelected: value == Gender.male,
                          onTap: () => selectedGender.value = Gender.male),
                      _buildGenderItem(context,
                          gender: Gender.female,
                          isSelected: value == Gender.female,
                          onTap: () => selectedGender.value = Gender.female),
                    ],
                  ),
                  Gap(32),
                  GestureDetector(
                    onTap: () => selectedGender.value = Gender.preferNotToSay,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: value == Gender.preferNotToSay
                            ? AppThemeConst.primaryColor
                            : Colors.transparent,
                        border: Border.all(
                          color: value == Gender.preferNotToSay
                              ? AppThemeConst.primaryColor
                              : AppThemeConst.neutralColor2.withOpacity(0.3),
                        ),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Text(
                        t.core.prefer_not_to_say,
                        style: context.textTheme.body17.copyWith(
                          color: value == Gender.preferNotToSay
                              ? Colors.white
                              : AppThemeConst.neutralColor1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              onPressed: () {
                if (value != null) {
                  cubit.updateUserInfo(gender: value);
                  cubit.nextStep();
                }
              },
            );
          }
        );
      },
    );
  }

  Widget _buildGenderItem(
    BuildContext context, {
    required Gender gender,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isSelected ? AppThemeConst.primaryColor : Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected
                    ? AppThemeConst.primaryColor
                    : AppThemeConst.neutralColor2.withOpacity(0.3),
              ),
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: AppThemeConst.primaryColor.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      )
                    ]
                  : null,
            ),
            child: Icon(
              gender.icon,
              color: isSelected ? Colors.white : AppThemeConst.neutralColor1,
              size: 48,
            ),
          ),
          const Gap(8),
          Text(
            gender.name,
            style: context.textTheme.body17.copyWith(
              color: isSelected
                  ? AppThemeConst.primaryColor
                  : AppThemeConst.neutralColor1,
            ),
          ),
        ],
      ),
    );
  }
}
