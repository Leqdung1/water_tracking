import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:water_tracking/core/extensions/theme_extension.dart';
import 'package:water_tracking/core/style/text_style.dart';

import '../../core/constants/app_theme_const.dart';
import '../../survey/cubit/survey_cubit.dart';

class AgePicker extends StatefulWidget {
  final int? selectedAge;
  const AgePicker({super.key, this.selectedAge});

  @override
  State<AgePicker> createState() => _AgePickerState();
}

class _AgePickerState extends State<AgePicker> {
  static const double itemExtent = 50;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    // Initialize selected index based on current state
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final state = context.read<SurveyCubit>().state;
      final selectedAge = widget.selectedAge ?? state.userInfo?.age ?? 25;
      final ages = List<int>.generate(100 - 12 + 1, (i) => 12 + i);
      final initialIndex = (selectedAge - 12).clamp(0, ages.length - 1);
      setState(() {
        _selectedIndex = initialIndex;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurveyCubit, SurveyState>(
      builder: (context, state) {
        final cubit = context.read<SurveyCubit>();
        final int selectedAge = state.userInfo?.age ?? 25;
        final List<int> ages = List<int>.generate(100 - 12 + 1, (i) => 12 + i);
        final int initialIndex = (selectedAge - 12).clamp(0, ages.length - 1);

        return SizedBox(
          height: 420,
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
            onSelectedItemChanged: (index) {
              setState(() {
                _selectedIndex = index;
              });
              cubit.updateUserInfo(age: ages[index]);
            },
            children: List.generate(ages.length, (index) {
              final value = ages[index];
              final isSelected = index == _selectedIndex;

              return Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
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
                    Gap(6),
                    if (isSelected)
                      Text(
                        'years',
                        style: context.textTheme.body22.copyWith(
                          color: AppThemeConst.neutralColor1,
                          fontWeight:
                              isSelected ? FontWeight.w700 : FontWeight.normal,
                          fontSize: 18,
                        ),
                      ),
                  ],
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
