import 'package:flutter/material.dart';
import 'package:water_tracking/screens/report/widgets/drink_charts.dart';
import 'package:water_tracking/screens/report/widgets/drink_type_chart.dart';
import 'package:water_tracking/screens/report/widgets/hydrate_charts.dart';
import 'package:water_tracking/screens/report/widgets/stat_period_picker.dart';

import '../../core/constants/app_theme_const.dart';
import '../../i18n/strings.g.dart';
import '../../widgets/appbar/app_appbar.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppbar(
        title: t.core.report,
        backgroundColor: AppThemeConst.neutralColor3,
        bottomSection: StatPeriodPicker(
          isSelected: true,
          onTap: () {},
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          DrinkCharts(),
          HydrateCharts(),
          DrinkTypeChart(),
        ],
      ),
    );
  }
}
