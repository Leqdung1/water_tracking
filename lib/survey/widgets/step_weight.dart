import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:water_tracking/core/extensions/theme_extension.dart';
import 'package:water_tracking/core/style/text_style.dart';
import 'package:water_tracking/survey/widgets/step_widget.dart';
import 'package:water_tracking/widgets/picker/weight_picker.dart';

import '../../core/constants/app_theme_const.dart';
import '../../core/enum/app_enum.dart';
import '../../i18n/strings.g.dart';
import '../cubit/survey_cubit.dart';

class StepWeight extends StatefulWidget {
  const StepWeight({super.key});

  @override
  State<StepWeight> createState() => _StepWeightState();
}

class _StepWeightState extends State<StepWeight> {
  final ValueNotifier<WeightUnit> selectedUnit = ValueNotifier(WeightUnit.kg);
  final ValueNotifier<double> selectedWeightKg = ValueNotifier(70.0);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurveyCubit, SurveyState>(
      builder: (context, state) {
        final cubit = context.read<SurveyCubit>();

        return ValueListenableBuilder(
          valueListenable: selectedUnit,
          builder: (context, unit, child) {
            return ValueListenableBuilder(
              valueListenable: selectedWeightKg,
              builder: (context, weightKg, child) {
                return StepWidget(
                  title: t.core.how_much_do_you_weight,
                  description: t.core
                      .your_weight_plays_a_crucial_role_in_determining_your_hydration_needs_select_your_weight_below,
                  isEnabled: true,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // Unit toggle
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _unitChip(context, 'kg', unit == WeightUnit.kg, () {
                              selectedUnit.value = WeightUnit.kg;
                            }),
                            const Gap(8),
                            _unitChip(context, 'lb', unit == WeightUnit.lb, () {
                              selectedUnit.value = WeightUnit.lb;
                            }),
                          ],
                        ),
                      ),
                      const Gap(16),
                      SizedBox(
                        height: 220,
                        child: Column(
                          children: [
                            WeightPicker(
                              unit: unit,
                              selectedWeightKg: weightKg,
                              onWeightChanged: (newWeightKg) {
                                selectedWeightKg.value = newWeightKg;
                              },
                            ),
                            const Gap(8),
                          ],
                        ),
                      ),
                    ],
                  ),
                  onPressed: () async {
                    cubit.updateUserInfo(weightUnit: unit, weightKg: weightKg);
                    cubit.nextStep();
                  },
                );
              },
            );
          },
        );
      },
    );
  }

  Widget _unitChip(
      BuildContext context, String label, bool selected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        decoration: BoxDecoration(
          color: selected ? AppThemeConst.primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            color: selected
                ? AppThemeConst.primaryColor
                : AppThemeConst.neutralColor2.withOpacity(0.3),
          ),
        ),
        child: Text(
          label,
          style: context.textTheme.body15.copyWith(
            color: selected ? Colors.white : AppThemeConst.neutralColor1,
          ),
        ),
      ),
    );
  }
}
