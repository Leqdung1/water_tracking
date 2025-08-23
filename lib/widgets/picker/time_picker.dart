import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:water_tracking/core/extensions/theme_extension.dart';
import 'package:water_tracking/core/style/text_style.dart';

import '../../core/constants/app_theme_const.dart';

class TimePicker extends StatefulWidget {
  final TimeOfDay selectedTime;
  final Function(TimeOfDay) onTimeChanged;

  const TimePicker({
    super.key,
    required this.selectedTime,
    required this.onTimeChanged,
  });

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  int _selectedHourIndex = 0;
  int _selectedMinuteIndex = 0;
  bool _isAM = true;

  late FixedExtentScrollController hourScrollController;
  late FixedExtentScrollController minuteScrollController;

  final List<int> hours = List.generate(25, (i) => i); // 1-12
  final List<int> minutes = List.generate(61, (i) => i); // 0-60

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  void _initializeControllers() {
    // Convert 24-hour to 12-hour format
    int hour12 = widget.selectedTime.hour;
    if (hour12 == 0) hour12 = 12;
    if (hour12 > 12) hour12 -= 12;

    _selectedHourIndex = hour12 - 1;
    _selectedMinuteIndex = widget.selectedTime.minute;
    _isAM = widget.selectedTime.hour < 12;

    hourScrollController =
        FixedExtentScrollController(initialItem: _selectedHourIndex);
    minuteScrollController =
        FixedExtentScrollController(initialItem: _selectedMinuteIndex);
  }

  @override
  void dispose() {
    hourScrollController.dispose();
    minuteScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color selectedColor = AppThemeConst.primaryColor;
    final Color unselectedColor = AppThemeConst.neutralColor2;
    final double pickerHeight = 220;
    final double itemExtent = 44;

    return Container(
      height: pickerHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ---------------------------- Hour Picker ---------------------------- //
          SizedBox(
            width: 100,
            height: 250,
            child: CupertinoPicker(
              itemExtent: itemExtent,
              scrollController: hourScrollController,
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
              onSelectedItemChanged: (index) {
                setState(() {
                  _selectedHourIndex = index;
                });
              },
              children: List.generate(hours.length, (index) {
                final bool isSelected = index == _selectedHourIndex;
                return Center(
                  child: Text(
                    hours[index].toString().padLeft(2, '0'),
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
          const Gap(10),
          // ---------------------------- Minute Picker ---------------------------- //
          SizedBox(
            width: 100,
            height: 250,
            child: CupertinoPicker(
              itemExtent: itemExtent,
              scrollController: minuteScrollController,
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
              onSelectedItemChanged: (index) {
                setState(() {
                  _selectedMinuteIndex = index;
                });
              },
              children: List.generate(minutes.length, (index) {
                final bool isSelected = index == _selectedMinuteIndex;
                return Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        minutes[index].toString().padLeft(2, '0'),
                        style: context.textTheme.body22.copyWith(
                          color: isSelected ? selectedColor : unselectedColor,
                          fontWeight:
                              isSelected ? FontWeight.w700 : FontWeight.normal,
                          fontSize: isSelected ? 26 : 18,
                        ),
                      ),
                      if (isSelected) ...[
                        const Gap(4),
                        Text(
                          _isAM ? ' AM' : ' PM',
                          style: context.textTheme.body15.copyWith(
                            color: AppThemeConst.neutralColor1,
                          ),
                        ),
                      ],
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
