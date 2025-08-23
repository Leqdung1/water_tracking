import 'package:flutter/cupertino.dart';
import 'package:water_tracking/core/extensions/theme_extension.dart';
import 'package:water_tracking/core/style/text_style.dart';

import '../../core/constants/app_theme_const.dart';
import '../../core/enum/app_enum.dart';

class HeightPicker extends StatefulWidget {
  final HeightUnit unit;
  final double selectedHeightCm;
  final Function(double) onHeightChanged;

  const HeightPicker({
    super.key,
    required this.unit,
    required this.selectedHeightCm,
    required this.onHeightChanged,
  });

  @override
  State<HeightPicker> createState() => _HeightPickerState();
}

class _HeightPickerState extends State<HeightPicker> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _updateSelectedIndex();
  }

  @override
  void didUpdateWidget(HeightPicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.unit != widget.unit ||
        oldWidget.selectedHeightCm != widget.selectedHeightCm) {
      _updateSelectedIndex();
    }
  }

  void _updateSelectedIndex() {
    final List<int> values = widget.unit == HeightUnit.cm
        ? List<int>.generate(241 - 120, (i) => 120 + i)
        : List<int>.generate(8 * 12 + 11, (i) => i);

    if (widget.unit == HeightUnit.cm) {
      _selectedIndex =
          (widget.selectedHeightCm - 120).clamp(0, values.length - 1).toInt();
    } else {
      final inches = ((widget.selectedHeightCm) / 2.54).round();
      _selectedIndex = inches.clamp(0, values.length - 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Build items based on unit
    final List<int> values = widget.unit == HeightUnit.cm
        ? List<int>.generate(241 - 120, (i) => 120 + i) // 120..240
        : List<int>.generate(
            8 * 12 + 11, (i) => i); // 0..107 inches -> 0..8'11" roughly

    double initialIndex;
    if (widget.unit == HeightUnit.cm) {
      initialIndex =
          (widget.selectedHeightCm - 120).clamp(0, values.length - 1);
    } else {
      // convert cm to inches
      final inches = ((widget.selectedHeightCm) / 2.54).round();
      initialIndex = inches.clamp(0, values.length - 1).toDouble();
    }

    void onSelectedItemChanged(double index) {
      setState(() {
        _selectedIndex = index.toInt();
      });

      if (widget.unit == HeightUnit.cm) {
        widget.onHeightChanged(values[index.toInt()].toDouble());
      } else {
        final feet = values[index.toInt()] ~/ 12;
        final inch = values[index.toInt()] % 12;
        final cm = (((feet * 12) + inch) * 2.54).round();
        widget.onHeightChanged(cm.toDouble());
      }
    }

    return SizedBox(
      height: 400,
      width: 100,
      child: CupertinoPicker(
        itemExtent: 50,
        scrollController:
            FixedExtentScrollController(initialItem: initialIndex.toInt()),
        onSelectedItemChanged: (index) =>
            onSelectedItemChanged(index.toDouble()),
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
        children: values.asMap().entries.map((entry) {
          final index = entry.key;
          final value = entry.value;
          final isSelected = index == _selectedIndex;

          return Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.unit == HeightUnit.cm
                      ? '$value'
                      : (() {
                          final feet = value ~/ 12;
                          final inch = value % 12;
                          return "$feet' $inch\"";
                        })(),
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
                    widget.unit == HeightUnit.cm ? ' cm' : ' in',
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
