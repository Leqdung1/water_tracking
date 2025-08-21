import 'package:flutter/material.dart';
import 'package:water_tracking/screens/report/widgets/chart_header.dart';
import 'package:water_tracking/screens/report/widgets/column_chart.dart';
import 'package:water_tracking/screens/report/widgets/stat_chart_card.dart';

import '../../../i18n/strings.g.dart';

class DrinkCharts extends StatefulWidget {
  const DrinkCharts({super.key});

  @override
  State<DrinkCharts> createState() => _DrinkChartsState();
}

class _DrinkChartsState extends State<DrinkCharts> {
  @override
  Widget build(BuildContext context) {
    return StatChartCard(
      chartSection: ColumnChart(),
      headerSection: ChartHeader(
        title: t.core.drink_completion,
        isSelected: true,
      ),
    );
  }

}
