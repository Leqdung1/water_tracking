import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:water_tracking/core/constants/asset_path_const.dart';
import 'package:water_tracking/core/extensions/theme_extension.dart';
import 'package:water_tracking/core/style/text_style.dart';
import 'package:water_tracking/survey/widgets/step_widget.dart';

import '../../core/constants/app_theme_const.dart';
import '../../core/enum/app_enum.dart';
import '../../i18n/strings.g.dart';
import '../../widgets/picker/height_picker.dart';
import '../cubit/survey_cubit.dart';

class StepTall extends StatefulWidget {
  const StepTall({super.key});

  @override
  State<StepTall> createState() => _StepTallState();
}

class _StepTallState extends State<StepTall> {
  final ValueNotifier<HeightUnit> selectedUnit = ValueNotifier(HeightUnit.cm);
  final ValueNotifier<double> selectedHeightCm = ValueNotifier(170.0);

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
              valueListenable: selectedHeightCm,
              builder: (context, heightCm, child) {
                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Image.asset(
                        height: 500,
                        AssetPathConst.imgNormal,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    StepWidget(
                      title: t.core.how_tall_are_you,
                      description: t.core
                          .your_height_is_another_key_factor_in_customizing_your_hydration_plan_choose_your_height_measurement,
                      isEnabled:
                          true, 
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Unit toggle
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _unitChip(context, 'cm', unit == HeightUnit.cm,
                                  () {
                                selectedUnit.value = HeightUnit.cm;
                              }),
                              const Gap(8),
                              _unitChip(context, 'ft', unit == HeightUnit.ft,
                                  () {
                                selectedUnit.value = HeightUnit.ft;
                              }),
                            ],
                          ),
                          const Gap(16),

                          SizedBox(
                            height: 220,
                            width: 100,
                            child: HeightPicker(
                              unit: unit,
                              selectedHeightCm: heightCm,
                              onHeightChanged: (newHeightCm) {
                                selectedHeightCm.value = newHeightCm;
                              },
                            ),
                          ),
                        ],
                      ),
                      onPressed: () async {
                        cubit.updateUserInfo(unit: unit, heightCm: heightCm);
                        cubit.nextStep();
                      },
                    ),
                  ],
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
