import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../data/entity/chart_data.dart';

class PieChart extends StatelessWidget {
  const PieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      // legend: Legend(
      //   isVisible: true,
      //   position: LegendPosition.right,
      //   overflowMode: LegendItemOverflowMode.wrap,
      //   orientation: LegendItemOrientation.horizontal,
      //   textStyle: context.textTheme.body12,
      // ),
      series: [
        DoughnutSeries<ChartData, String>(
          dataSource: [
            ChartData(label: 'Water', value: 100),
            ChartData(label: 'Tea', value: 200),
            ChartData(label: 'Coffee', value: 300),
            ChartData(label: 'Juice', value: 400),
            ChartData(label: 'Other', value: 500),
            ChartData(label: 'Coffee', value: 300),
            ChartData(label: 'Juice', value: 400),
            ChartData(label: 'Other', value: 500),
          ],
          xValueMapper: (ChartData data, _) => data.label,
          yValueMapper: (ChartData data, _) => data.value,
          dataLabelSettings: DataLabelSettings(
            isVisible: true,
            labelPosition: ChartDataLabelPosition.outside,
          ),
          innerRadius: '80%',
          radius: '50%',
        ),
      ],
    );
  }
}
