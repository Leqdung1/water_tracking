import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:water_tracking/core/constants/app_theme_const.dart';
import 'package:water_tracking/core/enum/app_enum.dart';
import 'package:water_tracking/screens/report/cubit/report_cubit.dart';

import '../../../domain/entity/chart_data.dart';

class PieChart extends StatelessWidget {
  const PieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportCubit, ReportState>(
      builder: (context, state) {
        final drinkTypeData = state.drinkTypeChartData;

        // If no data, show empty state
        if (drinkTypeData.isEmpty) {
          return Container(
            height: 200,
            child: Center(
              child: Text(
                'No drink data available',
                style: TextStyle(
                  color: AppThemeConst.neutralColor2,
                  fontSize: 16,
                ),
              ),
            ),
          );
        }

        return SfCircularChart(
          legend: Legend(
            isVisible: true,
            position: LegendPosition.right,
            overflowMode: LegendItemOverflowMode.wrap,
            orientation: LegendItemOrientation.vertical,
            textStyle: TextStyle(
              color: AppThemeConst.neutralColor1,
              fontSize: 12,
            ),
          ),
          series: [
            DoughnutSeries<ChartData, String>(
              dataSource: drinkTypeData,
              xValueMapper: (ChartData data, _) => data.label,
              yValueMapper: (ChartData data, _) => data.value,
              dataLabelSettings: DataLabelSettings(
                isVisible: true,
                labelPosition: ChartDataLabelPosition.outside,
                textStyle: TextStyle(
                  color: AppThemeConst.neutralColor1,
                  fontSize: 12,
                ),
              ),
              innerRadius: '60%',
              radius: '80%',
              pointColorMapper: (ChartData data, _) =>
                  _getDrinkTypeColor(data.label),
              dataLabelMapper: (ChartData data, _) => '${data.value.toInt()}',
            ),
          ],
        );
      },
    );
  }

  /// Get color for each drink type
  Color _getDrinkTypeColor(String drinkType) {
    switch (drinkType.toLowerCase()) {
      case 'water':
        return const Color(0xFF4FC3F7); // Light blue
      case 'tea':
        return const Color(0xFF8D6E63); // Brown
      case 'coffee':
        return const Color(0xFF5D4037); // Dark brown
      case 'juice':
        return const Color(0xFFFF9800); // Orange
      case 'beer':
        return const Color(0xFFFFC107); // Amber
      case 'carbon':
        return const Color(0xFF9C27B0); // Purple
      case 'coconute':
        return const Color(0xFF4CAF50); // Green
      case 'liquor':
        return const Color(0xFFE91E63); // Pink
      case 'smoothie':
        return const Color(0xFF00BCD4); // Cyan
      case 'soda':
        return const Color(0xFF607D8B); // Blue grey
      case 'wine':
        return const Color(0xFF9C27B0); // Purple
      default:
        return AppThemeConst.primaryColor;
    }
  }
}
