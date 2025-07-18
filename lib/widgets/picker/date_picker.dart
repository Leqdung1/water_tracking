import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:water_tracking/core/enum/app_enum.dart';
import 'package:water_tracking/core/extensions/theme_extension.dart';
import 'package:water_tracking/core/style/text_style.dart';

import '../../core/constants/app_theme_const.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({super.key});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  int selectedMonth = DateTime.now().month;
  int selectedYear = DateTime.now().year;
  int selectedDay = DateTime.now().day;

  late FixedExtentScrollController monthScrollController;
  late FixedExtentScrollController yearScrollController;
  late FixedExtentScrollController dayScrollController;

  final List<String> months =
      List.generate(12, (index) => Month.values[index].name);
  final List<int> days = List.generate(31, (index) => index + 1);
  final List<int> years = List.generate(226, (index) => 1800 + index);

  Timer? _debounce;

  @override
  void initState() {
    super.initState();

    monthScrollController =
        FixedExtentScrollController(initialItem: selectedMonth - 1);
    dayScrollController =
        FixedExtentScrollController(initialItem: selectedDay - 1);
    yearScrollController =
        FixedExtentScrollController(initialItem: selectedYear - 1800);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    monthScrollController.dispose();
    yearScrollController.dispose();
    dayScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ---------------------------- Month Picker ---------------------------- //
          Expanded(
            child: CupertinoPicker(
              itemExtent: 33,
              scrollController: monthScrollController,
              onSelectedItemChanged: (index) {
                selectedMonth = index + 1;
              },
              children: months.map((month) {
                return Center(
                  child: Text(
                    month,
                    style: context.textTheme.body22.copyWith(
                      color: AppThemeConst.neutralColor1,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          // ---------------------------- Day Picker ---------------------------- //
          Expanded(
            child: CupertinoPicker(
              itemExtent: 33,
              scrollController: dayScrollController,
              onSelectedItemChanged: (index) {
                selectedDay = index + 1;
              },
              children: days.map((day) {
                return Center(
                  child: Text(
                    day.toString(),
                    style: context.textTheme.body22.copyWith(
                      color: AppThemeConst.neutralColor1,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          // ---------------------------- Year Picker ---------------------------- //
          Expanded(
            child: CupertinoPicker(
              itemExtent: 33,
              scrollController: yearScrollController,
              onSelectedItemChanged: (index) {
                selectedYear = years[index];
              },
              children: years.map((year) {
                return Center(
                  child: Text(
                    year.toString(),
                    style: context.textTheme.body22.copyWith(
                      color: AppThemeConst.neutralColor1,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
