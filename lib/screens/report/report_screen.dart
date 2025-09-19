import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_tracking/core/enum/app_enum.dart';
import 'package:water_tracking/screens/report/cubit/report_cubit.dart';
import 'package:water_tracking/screens/report/widgets/drink_charts.dart';
import 'package:water_tracking/screens/report/widgets/drink_type_chart.dart';
import 'package:water_tracking/screens/report/widgets/hydrate_charts.dart';
import 'package:water_tracking/screens/report/widgets/stat_period_picker.dart';

import '../../core/constants/app_theme_const.dart';
import '../../i18n/strings.g.dart';
import '../../widgets/appbar/app_appbar.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  late final ReportCubit reportCubit;

  @override
  void initState() {
    super.initState();
    reportCubit = context.read<ReportCubit>();

    // Load initial data (current week)
    final now = DateTime.now();
    final weekStart = now.subtract(Duration(days: now.weekday - 1));
    reportCubit.loadReportData(ReportPeriod.weekly, weekStart);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppbar(
        title: t.core.report,
        backgroundColor: AppThemeConst.neutralColor3,
        bottomSection: StatPeriodPicker(),
      ),
      body: BlocBuilder<ReportCubit, ReportState>(
        builder: (context, state) {
          if (state.status == BlocStatus.loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            shrinkWrap: true,
            children: [
              DrinkCharts(),
              HydrateCharts(),
              DrinkTypeChart(),
            ],
          );
        },
      ),
    );
  }
}
