import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:water_tracking/core/extensions/theme_extension.dart';
import 'package:water_tracking/core/style/text_style.dart';

import '../../core/constants/app_theme_const.dart';
import '../../core/enum/app_enum.dart';
import '../../survey/cubit/survey_cubit.dart';

class HeightPicker extends StatefulWidget {
  const HeightPicker({super.key});

  @override
  State<HeightPicker> createState() => _HeightPickerState();
}

class _HeightPickerState extends State<HeightPicker> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurveyCubit, SurveyState>(
      builder: (context, state) {
        final cubit = context.read<SurveyCubit>();
        final unit = state.heightUnit;
        final int selectedCm = state.heightCm ?? 170;

        // Build items based on unit
        final List<int> values = unit == HeightUnit.cm
            ? List<int>.generate(241 - 120, (i) => 120 + i) // 120..240
            : List<int>.generate(
                8 * 12 + 11, (i) => i); // 0..107 inches -> 0..8'11" roughly

        int initialIndex;
        if (unit == HeightUnit.cm) {
          initialIndex = (selectedCm - 120).clamp(0, values.length - 1);
        } else {
          // convert cm to inches
          final inches = ((selectedCm) / 2.54).round();
          initialIndex = inches.clamp(0, values.length - 1);
        }

        void onSelectedItemChanged(int index) {
          if (unit == HeightUnit.cm) {
            cubit.updateHeightCm(values[index]);
          } else {
            final feet = values[index] ~/ 12;
            final inch = values[index] % 12;
            final cm = (((feet * 12) + inch) * 2.54).round();
            cubit.updateHeightCm(cm);
          }
        }

        return Expanded(
          child: CupertinoPicker(
            itemExtent: 50,
            scrollController:
                FixedExtentScrollController(initialItem: initialIndex),
            onSelectedItemChanged: onSelectedItemChanged,
            selectionOverlay: Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 1,
                    color: AppThemeConst.primaryColor,
                  ),
                  bottom: BorderSide(
                    width: 1,
                    color: AppThemeConst.primaryColor,
                  ),
                ),
              ),
            ),
            children: values.map((v) {
              return Center(
                child: Text(
                  unit == HeightUnit.cm
                      ? '$v'
                      : (() {
                          final feet = v ~/ 12;
                          final inch = v % 12;
                          return "$feet' $inch\"";
                        })(),
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
