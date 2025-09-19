import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:water_tracking/core/extensions/theme_extension.dart';
import 'package:water_tracking/core/style/text_style.dart';
import 'package:water_tracking/screens/report/cubit/report_cubit.dart';

import '../../../core/constants/app_theme_const.dart';
import '../../../domain/entity/chart_data.dart';

class ColumnChart extends StatelessWidget {
  const ColumnChart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportCubit, ReportState>(
      builder: (context, state) {
        final chartData = state.chartData;
        final maxValue = chartData.isNotEmpty
            ? chartData.map((e) => e.value).reduce((a, b) => a > b ? a : b)
            : 500.0;

        return SfCartesianChart(
          tooltipBehavior: TooltipBehavior(
            enable: true,
            color: AppThemeConst.primaryColor,
            canShowMarker: false,
            format: 'point.y mL',
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
            maximum: maxValue > 0 ? maxValue * 1.1 : 500, // Add 10% padding
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
              dataSource: chartData,
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
      },
    );
  }
}
