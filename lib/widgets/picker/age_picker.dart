import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_tracking/core/extensions/theme_extension.dart';
import 'package:water_tracking/core/style/text_style.dart';

import '../../core/constants/app_theme_const.dart';
import '../../survey/cubit/survey_cubit.dart';

class AgePicker extends StatefulWidget {
  const AgePicker({super.key});

  @override
  State<AgePicker> createState() => _AgePickerState();
}

class _AgePickerState extends State<AgePicker> {
  static const double itemExtent = 44;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurveyCubit, SurveyState>(
      builder: (context, state) {
        final cubit = context.read<SurveyCubit>();
        final int selectedAge = state.userInfo?.age ?? 25;
        final List<int> ages =
            List<int>.generate(100 - 12 + 1, (i) => 12 + i); // 12..100
        final int initialIndex = (selectedAge - 12).clamp(0, ages.length - 1);

        return SizedBox(
          height: 220,
          width: 100,
          child: CupertinoPicker(
            itemExtent: itemExtent,
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
            onSelectedItemChanged: (index) => cubit.updateAge(ages[index]),
            children: List.generate(ages.length, (index) {
              final value = ages[index];
              final isSelected = (state.userInfo?.age ?? selectedAge) == value;
              return Center(
                child: Text(
                  value.toString(),
                  style: context.textTheme.body22.copyWith(
                    color: isSelected
                        ? AppThemeConst.primaryColor
                        : AppThemeConst.neutralColor2,
                    fontWeight:
                        isSelected ? FontWeight.w700 : FontWeight.normal,
                    fontSize: isSelected ? 26 : 18,
                  ),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
