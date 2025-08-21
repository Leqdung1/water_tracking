import 'package:flutter/material.dart';
import 'package:water_tracking/screens/report/widgets/chart_header.dart';
import 'package:water_tracking/screens/report/widgets/line_chart.dart';
import 'package:water_tracking/screens/report/widgets/stat_chart_card.dart';

import '../../../i18n/strings.g.dart';

class HydrateCharts extends StatefulWidget {
  const HydrateCharts({super.key});

  @override
  State<HydrateCharts> createState() => _HydrateChartsState();
}

class _HydrateChartsState extends State<HydrateCharts> {
  @override
  Widget build(BuildContext context) {
    return StatChartCard(
      chartSection: LineChart(),
      headerSection: ChartHeader(
        title: t.core.hydrate,
        isSelected: true,
      ),
    );
  }
}
