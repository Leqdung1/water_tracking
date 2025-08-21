import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:water_tracking/core/extensions/theme_extension.dart';
import 'package:water_tracking/core/style/text_style.dart';
import 'package:intl/intl.dart';

import '../../../core/constants/app_theme_const.dart';
import '../../../i18n/strings.g.dart';

class StatPeriodPicker extends StatelessWidget {
  const StatPeriodPicker(
      {super.key, required this.isSelected, required this.onTap});

  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildFilterTabs(context),
        Gap(16),
        _buildTimeRange(context),
      ],
    );
  }

  Widget _buildFilterTabs(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppThemeConst.neutralColor2.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          // Bar Chart Button
          Flexible(
            child: GestureDetector(
              onTap: () {
                onTap();
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppThemeConst.primaryColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Text(t.core.weekly,
                      style: context.textTheme.body17.copyWith(
                          color: isSelected
                              ? Colors.white
                              : AppThemeConst.neutralColor1)),
                ),
              ),
            ),
          ),

          // Line Graph Button
          Flexible(
            child: GestureDetector(
              onTap: () {
                onTap();
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppThemeConst.primaryColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Text(t.core.monthly,
                      style: context.textTheme.body17.copyWith(
                          color: isSelected
                              ? Colors.white
                              : AppThemeConst.neutralColor1)),
                ),
              ),
            ),
          ),

          Flexible(
            child: GestureDetector(
              onTap: () {
                onTap();
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppThemeConst.primaryColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Text(t.core.yearly,
                      style: context.textTheme.body17.copyWith(
                          color: isSelected
                              ? Colors.white
                              : AppThemeConst.neutralColor1)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeRange(BuildContext context) {
    final DateTime now = DateTime.now();
    final int weekday = now.weekday; // 1 = Monday, 7 = Sunday
    final DateTime weekStart = now.subtract(Duration(days: weekday - 1));
    final DateTime weekEnd = weekStart.add(const Duration(days: 6));

    final String startLabel = DateFormat('MMM d').format(weekStart);
    final String endLabel = DateFormat('MMM d, yyyy').format(weekEnd);
    final String label = '$startLabel - $endLabel';

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.chevron_left, color: AppThemeConst.neutralColor2),
          ),
          Expanded(
            child: Center(
              child: Text(
                label,
                style: context.textTheme.body17.copyWith(
                  color: AppThemeConst.neutralColor1,
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.chevron_right, color: AppThemeConst.neutralColor2),
          ),
        ],
      ),
    );
  }
}
