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
          final kg = kgValues[index];
          widget.onWeightChanged(kg.toDouble());
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
  }
}
