import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:water_tracking/core/extensions/theme_extension.dart';
import 'package:water_tracking/core/style/text_style.dart';

import '../../../core/constants/app_theme_const.dart';
import '../../../data/entity/chart_data.dart';

class LineChart extends StatelessWidget {
  const LineChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      tooltipBehavior: TooltipBehavior(
        enable: true,
        color: Colors.white,
        canShowMarker: false,
        format: 'point.x : point.y mL',
      ),
      margin: EdgeInsets.zero,
      primaryXAxis: CategoryAxis(
        labelStyle: context.textTheme.body15.copyWith(
          color: AppThemeConst.neutralColor2,
        ),
        axisLine: const AxisLine(
          color: Colors.white,
        ),
        majorTickLines: const MajorTickLines(
          color: Colors.white,
        ),
        majorGridLines: const MajorGridLines(
          color: Colors.white,
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
        AreaSeries<ChartData, String>(
          dataSource: [
            ChartData(label: '16', value: 100),
            ChartData(label: '17', value: 50),
            ChartData(label: '18', value: 250),
            ChartData(label: '19', value: 320),
            ChartData(label: '20', value: 300),
            ChartData(label: '21', value: 180),
            ChartData(label: '22', value: 220),
          ],
          xValueMapper: (ChartData data, _) => data.label,
          yValueMapper: (ChartData data, _) => data.value,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF00BDFF).withValues(alpha: 0.06),
              Color(0xFFC6ECFF),
              Colors.white,
            ],
          ),
          borderColor: Colors.transparent,
        ),
        LineSeries<ChartData, String>(
          dataSource: [
            ChartData(label: '16', value: 100),
            ChartData(label: '17', value: 50),
            ChartData(label: '18', value: 250),
            ChartData(label: '19', value: 320),
            ChartData(label: '20', value: 300),
            ChartData(label: '21', value: 180),
            ChartData(label: '22', value: 220),
          ],
          xValueMapper: (ChartData data, _) => data.label,
          yValueMapper: (ChartData data, _) => data.value,
          color: AppThemeConst.primaryColor,
          width: 4,
          markerSettings: MarkerSettings(
            isVisible: true,
            height: 12,
            width: 12,
            borderColor: AppThemeConst.primaryColor,
            color: AppThemeConst.neutralColor3,
            borderWidth: 2,
          ),
        ),
      ],
    );
  }
}
