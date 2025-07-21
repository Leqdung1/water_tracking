import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:water_tracking/core/extensions/theme_extension.dart';
import 'package:water_tracking/core/style/text_style.dart';

import '../../core/constants/app_theme_const.dart';

class HourPicker extends StatefulWidget {
  const HourPicker({super.key});

  @override
  State<HourPicker> createState() => _HourPickerState();
}

class _HourPickerState extends State<HourPicker> {
  int selectedHour = DateTime.now().hour;
  int selectedMinute = DateTime.now().minute;

  late FixedExtentScrollController hourScrollController;
  late FixedExtentScrollController minuteScrollController;

  final List<int> hours = List.generate(25, (index) => index);
  final List<int> minutes = List.generate(61, (index) => index);

  Timer? _debounce;

  @override
  void initState() {
    super.initState();

    hourScrollController =
        FixedExtentScrollController(initialItem: selectedHour);
    minuteScrollController =
        FixedExtentScrollController(initialItem: selectedMinute);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    hourScrollController.dispose();
    minuteScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color selectedColor = AppThemeConst.primaryColor;
    final Color unselectedColor = AppThemeConst.neutralColor1;
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
              // ---------------------------- Hour Picker ---------------------------- //
              Expanded(
                child: CupertinoPicker(
                  itemExtent: itemExtent,
                  scrollController: hourScrollController,
                  selectionOverlay: Container(),
                  onSelectedItemChanged: (index) {
                    setState(() {
                      selectedHour = index;
                    });
                  },
                  children: List.generate(hours.length, (index) {
                    final bool isSelected = selectedHour == index;
                    return Center(
                      child: Text(
                        hours[index].toString(),
                        style: context.textTheme.body22.copyWith(
                          color: isSelected ? selectedColor : unselectedColor,
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.normal,
                          fontSize: isSelected ? 26 : 18,
                        ),
                      ),
                    );
                  }),
                ),
              ),

              // ---------------------------- Minute Picker ---------------------------- //
              Expanded(
                child: CupertinoPicker(
                  itemExtent: itemExtent,
                  scrollController: minuteScrollController,
                  selectionOverlay: Container(),
                  onSelectedItemChanged: (index) {
                    setState(() {
                      selectedMinute = index;
                    });
                  },
                  children: List.generate(minutes.length, (index) {
                    final bool isSelected = selectedMinute == index;
                    final bool isAM = selectedHour < 12;
                    return Row(
                      children: [
                        Text(
                          minutes[index].toString(),
                          style: context.textTheme.body22.copyWith(
                            color: isSelected ? selectedColor : unselectedColor,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                            fontSize: isSelected ? 26 : 18,
                          ),
                        ),
                        if (isSelected)
                          Text(
                            isAM ? ' AM' : ' PM',
                            style: context.textTheme.body22.copyWith(
                              color:
                                  isSelected ? selectedColor : unselectedColor,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              fontSize: isSelected ? 26 : 18,
                            ),
                          ),
                      ],
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
