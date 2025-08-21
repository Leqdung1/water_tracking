import 'package:flutter/material.dart';
import 'package:water_tracking/screens/report/widgets/chart_header.dart';
import 'package:water_tracking/screens/report/widgets/pie_chart.dart';
import 'package:water_tracking/screens/report/widgets/stat_chart_card.dart';

import '../../../i18n/strings.g.dart';

class DrinkTypeChart extends StatelessWidget {
  const DrinkTypeChart({super.key});

  @override
  Widget build(BuildContext context) {
    return StatChartCard(
      chartSection: PieChart(),
      headerSection: ChartHeader(
        title: t.core.drink_types,
        isSelected: true,
      ),
    );
  }
}
