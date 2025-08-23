import 'dart:async';

import 'package:flutter/cupertino.dart';
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

  int _selectedMonthIndex = 0;
  int _selectedDayIndex = 0;
  int _selectedYearIndex = 0;

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

    // Initialize selected indices
    _selectedMonthIndex = selectedMonth - 1;
    _selectedDayIndex = selectedDay - 1;
    _selectedYearIndex = selectedYear - 1800;

    monthScrollController =
        FixedExtentScrollController(initialItem: _selectedMonthIndex);
    dayScrollController =
        FixedExtentScrollController(initialItem: _selectedDayIndex);
    yearScrollController =
        FixedExtentScrollController(initialItem: _selectedYearIndex);
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
    final Color selectedColor = AppThemeConst.primaryColor;
    final Color unselectedColor = AppThemeConst.neutralColor2;
    final double pickerHeight = 220;
    final double itemExtent = 33;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      height: pickerHeight,
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ---------------------------- Month Picker ---------------------------- //
              Expanded(
                child: CupertinoPicker(
                  itemExtent: itemExtent,
                  scrollController: monthScrollController,
                  selectionOverlay: Container(),
                  onSelectedItemChanged: (index) {
                    setState(() {
                      _selectedMonthIndex = index;
                      selectedMonth = index + 1;
                    });
                  },
                  children: List.generate(months.length, (index) {
                    final bool isSelected = index == _selectedMonthIndex;
                    return Center(
                      child: Text(
                        months[index],
                        style: context.textTheme.body22.copyWith(
                          color: isSelected ? selectedColor : unselectedColor,
                          fontWeight:
                              isSelected ? FontWeight.w700 : FontWeight.normal,
                          fontSize: isSelected ? 26 : 18,
                        ),
                      ),
                    );
                  }),
                ),
              ),

              // ---------------------------- Day Picker ---------------------------- //
              Expanded(
                child: CupertinoPicker(
                  itemExtent: itemExtent,
                  scrollController: dayScrollController,
                  selectionOverlay: Container(),
                  onSelectedItemChanged: (index) {
                    setState(() {
                      _selectedDayIndex = index;
                      selectedDay = index + 1;
                    });
                  },
                  children: List.generate(days.length, (index) {
                    final bool isSelected = index == _selectedDayIndex;
                    return Center(
                      child: Text(
                        days[index].toString(),
                        style: context.textTheme.body22.copyWith(
                          color: isSelected ? selectedColor : unselectedColor,
                          fontWeight:
                              isSelected ? FontWeight.w700 : FontWeight.normal,
                          fontSize: isSelected ? 26 : 18,
                        ),
                      ),
                    );
                  }),
                ),
              ),

              // ---------------------------- Year Picker ---------------------------- //
              Expanded(
                child: CupertinoPicker(
                  itemExtent: itemExtent,
                  scrollController: yearScrollController,
                  selectionOverlay: Container(),
                  onSelectedItemChanged: (index) {
                    setState(() {
                      _selectedYearIndex = index;
                      selectedYear = years[index];
                    });
                  },
                  children: List.generate(years.length, (index) {
                    final bool isSelected = index == _selectedYearIndex;
                    return Center(
                      child: Text(
                        years[index].toString(),
                        style: context.textTheme.body22.copyWith(
                          color: isSelected ? selectedColor : unselectedColor,
                          fontWeight:
                              isSelected ? FontWeight.w700 : FontWeight.normal,
                          fontSize: isSelected ? 26 : 18,
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            top: pickerHeight / 2 - itemExtent / 2,
            child: Column(
              children: [
                Container(
                  height: 1,
                  color: AppThemeConst.primaryColor,
                ),
                SizedBox(height: itemExtent - 2),
                Container(
                  height: 1,
                  color: AppThemeConst.primaryColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
