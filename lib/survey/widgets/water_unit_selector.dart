import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:water_tracking/core/extensions/theme_extension.dart';
import 'package:water_tracking/core/style/text_style.dart';

import '../../core/constants/app_theme_const.dart';
import '../../core/enum/app_enum.dart';

class WaterUnitSelector extends StatelessWidget {
  final WaterUnit selectedUnit;
  final ValueChanged<WaterUnit> onUnitChanged;

  const WaterUnitSelector({
    super.key,
    required this.selectedUnit,
    required this.onUnitChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _unitChip(context, 'mL', selectedUnit == WaterUnit.ml, () {
            onUnitChanged(WaterUnit.ml);
          }),
          const Gap(8),
          _unitChip(context, 'L', selectedUnit == WaterUnit.l, () {
            onUnitChanged(WaterUnit.l);
          }),
        ],
      ),
    );
  }

  Widget _unitChip(
      BuildContext context, String label, bool selected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? AppThemeConst.primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label,
          style: context.textTheme.body15.copyWith(
            color: selected ? Colors.white : AppThemeConst.neutralColor1,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
