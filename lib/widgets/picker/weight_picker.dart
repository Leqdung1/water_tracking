import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_tracking/core/extensions/theme_extension.dart';
import 'package:water_tracking/core/style/text_style.dart';

import '../../core/constants/app_theme_const.dart';
import '../../core/enum/app_enum.dart';
import '../../survey/cubit/survey_cubit.dart';

class WeightPicker extends StatefulWidget {
  const WeightPicker({super.key});

  @override
  State<WeightPicker> createState() => _WeightPickerState();
}

class _WeightPickerState extends State<WeightPicker> {
  static const int minKg = 30;
  static const int maxKg = 200;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurveyCubit, SurveyState>(
      builder: (context, state) {
        final cubit = context.read<SurveyCubit>();
        final unit = state.weightUnit;
        final int selectedKg = state.weightKg ?? 70;

        final List<int> kgValues =
            List<int>.generate(maxKg - minKg + 1, (i) => minKg + i);

        final int initialIndex =
            (selectedKg - minKg).clamp(0, kgValues.length - 1);

        String displayForKg(int kg) {
          if (unit == WeightUnit.kg) return '$kg';
          final lb = (kg * 2.20462).round();
          return '$lb';
        }

        return Expanded(
          child: CupertinoPicker(
            itemExtent: 44,
            scrollController:
                FixedExtentScrollController(initialItem: initialIndex),
            selectionOverlay: Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1, color: AppThemeConst.primaryColor),
                  bottom:
                      BorderSide(width: 1, color: AppThemeConst.primaryColor),
                ),
              ),
            ),
            onSelectedItemChanged: (index) {
              final kg = kgValues[index];
              cubit.updateWeightKg(kg);
            },
            children: kgValues.map((kg) {
              return Center(
                child: Text(
                  displayForKg(kg),
                  style: context.textTheme.body22.copyWith(
                    color: AppThemeConst.primaryColor,
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
