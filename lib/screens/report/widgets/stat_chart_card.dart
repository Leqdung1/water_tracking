import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/constants/app_theme_const.dart';

class StatChartCard extends StatefulWidget {
  final Widget chartSection;
  final Widget headerSection;
  const StatChartCard({
    super.key,
    required this.chartSection,
    required this.headerSection,
  });

  @override
  State<StatChartCard> createState() => _StatChartCardState();
}

class _StatChartCardState extends State<StatChartCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppThemeConst.neutralColor3,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          widget.headerSection,
          Divider(
            color: AppThemeConst.dividerColor,
            thickness: 1,
          ),
          Gap(16),
          widget.chartSection,
        ],
      ),
    );
  }
}
