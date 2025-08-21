import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:water_tracking/core/extensions/theme_extension.dart';
import 'package:water_tracking/core/style/text_style.dart';

import '../../../core/constants/app_theme_const.dart';
import '../../../data/entity/chart_data.dart';

class ColumnChart extends StatelessWidget {
  const ColumnChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      tooltipBehavior: TooltipBehavior(
        enable: true,
        color: Colors.red,
        canShowMarker: false,
        format: 'MM/dd/yyyy',
      ),
      margin: EdgeInsets.zero,
      primaryXAxis: CategoryAxis(
        axisLine: const AxisLine(
          color: Colors.white,
        ),
        majorTickLines: const MajorTickLines(
          color: Colors.white,
        ),
        majorGridLines: const MajorGridLines(
          color: Colors.white,
        ),
        labelStyle: context.textTheme.body15.copyWith(
          color: AppThemeConst.neutralColor2,
        ),
      ),
      primaryYAxis: NumericAxis(
        minimum: 0,
        maximum: 500,
        labelStyle: context.textTheme.body15.copyWith(
          color: AppThemeConst.neutralColor2,
        ),
        axisLine: const AxisLine(
          color: Colors.white,
        ),
        majorGridLines: const MajorGridLines(
          color: Colors.white,
        ),
        majorTickLines: const MajorTickLines(
          color: Colors.white,
        ),
      ),
      series: <CartesianSeries<ChartData, String>>[
        ColumnSeries<ChartData, String>(
          dataSource: [
            ChartData(label: '1', value: 100),
            ChartData(label: '2', value: 200),
            ChartData(label: '3', value: 300),
            ChartData(label: '4', value: 400),
            ChartData(label: '5', value: 500),
          ],
          xValueMapper: (ChartData data, _) => data.label,
          yValueMapper: (ChartData data, _) => data.value,
          width: 0.8,
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFC6ECFF),
              Color(0xFF00BDFF),
            ],
          ),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(100),
          ),
        ),
      ],
    );
  }
}
