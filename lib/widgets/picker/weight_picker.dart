import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:water_tracking/core/extensions/theme_extension.dart';
import 'package:water_tracking/core/style/text_style.dart';

import '../../core/constants/app_theme_const.dart';
import '../../core/enum/app_enum.dart';

class WeightPicker extends StatefulWidget {
  final WeightUnit unit;
  final double? selectedWeightKg;
  final Function(double) onWeightChanged;

  const WeightPicker({
    super.key,
    required this.unit,
    required this.selectedWeightKg,
    required this.onWeightChanged,
  });

  @override
  State<WeightPicker> createState() => _WeightPickerState();
}

class _WeightPickerState extends State<WeightPicker> {
  static const int minKg = 30;
  static const int maxKg = 200;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _updateSelectedIndex();
  }

  @override
  void didUpdateWidget(WeightPicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.unit != widget.unit ||
        oldWidget.selectedWeightKg != widget.selectedWeightKg) {
      _updateSelectedIndex();
    }
  }

  void _updateSelectedIndex() {
    final List<int> kgValues =
        List<int>.generate(maxKg - minKg + 1, (i) => minKg + i);
    final double currentWeightKg = widget.selectedWeightKg ?? 70.0;
    _selectedIndex =
        (currentWeightKg - minKg).clamp(0, kgValues.length - 1).toInt();
  }

  @override
  Widget build(BuildContext context) {
    final List<int> kgValues =
        List<int>.generate(maxKg - minKg + 1, (i) => minKg + i);

    // Use default value if selectedWeightKg is null
    final double currentWeightKg = widget.selectedWeightKg ?? 70.0;

    final double initialIndex =
        (currentWeightKg - minKg).clamp(0, kgValues.length - 1).toDouble();

    String displayForKg(int kg) {
      if (widget.unit == WeightUnit.kg) return '$kg';
      final lb = (kg * 2.20462).round();
      return '$lb';
    }

    return SizedBox(
      height: 220,
      width: 100,
      child: CupertinoPicker(
        itemExtent: 44,
        scrollController:
            FixedExtentScrollController(initialItem: initialIndex.toInt()),
        selectionOverlay: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(width: 1, color: AppThemeConst.primaryColor),
              bottom: BorderSide(width: 1, color: AppThemeConst.primaryColor),
            ),
          ),
        ),
        onSelectedItemChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
          final kg = kgValues[index];
          widget.onWeightChanged(kg.toDouble());
        },
        children: kgValues.asMap().entries.map((entry) {
          final index = entry.key;
          final kg = entry.value;
          final isSelected = index == _selectedIndex;

          return Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  displayForKg(kg),
                  style: context.textTheme.body22.copyWith(
                    color: isSelected
                        ? AppThemeConst.primaryColor
                        : AppThemeConst.neutralColor2,
                    fontWeight:
                        isSelected ? FontWeight.w700 : FontWeight.normal,
                    fontSize: isSelected ? 26 : 18,
                  ),
                ),
                if (isSelected)
                  Text(
                    widget.unit == WeightUnit.kg ? ' kg' : ' lb',
                    style: context.textTheme.body22.copyWith(
                      color: isSelected
                          ? AppThemeConst.primaryColor
                          : AppThemeConst.neutralColor2,
                      fontWeight:
                          isSelected ? FontWeight.w700 : FontWeight.normal,
                      fontSize: isSelected ? 26 : 18,
                    ),
                  ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
