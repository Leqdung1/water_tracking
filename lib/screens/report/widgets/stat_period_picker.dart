import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:water_tracking/core/extensions/theme_extension.dart';
import 'package:water_tracking/core/style/text_style.dart';
import 'package:water_tracking/screens/report/cubit/report_cubit.dart';
import 'package:intl/intl.dart';

import '../../../core/constants/app_theme_const.dart';
import '../../../i18n/strings.g.dart';

class StatPeriodPicker extends StatelessWidget {
  const StatPeriodPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportCubit, ReportState>(
      builder: (context, state) {
        return Column(
          children: [
            _buildFilterTabs(context, state),
            Gap(16),
            _buildTimeRange(context, state),
          ],
        );
      },
    );
  }

  Widget _buildFilterTabs(BuildContext context, ReportState state) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppThemeConst.neutralColor2.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          // Weekly Tab
          Flexible(
            child: GestureDetector(
              onTap: () {
                context.read<ReportCubit>().changePeriod(ReportPeriod.weekly);
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: BoxDecoration(
                  color: state.selectedPeriod == ReportPeriod.weekly
                      ? AppThemeConst.primaryColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Text(t.core.weekly,
                      style: context.textTheme.body17.copyWith(
                          color: state.selectedPeriod == ReportPeriod.weekly
                              ? Colors.white
                              : AppThemeConst.neutralColor1)),
                ),
              ),
            ),
          ),

          // Monthly Tab
          Flexible(
            child: GestureDetector(
              onTap: () {
                context.read<ReportCubit>().changePeriod(ReportPeriod.monthly);
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: BoxDecoration(
                  color: state.selectedPeriod == ReportPeriod.monthly
                      ? AppThemeConst.primaryColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Text(t.core.monthly,
                      style: context.textTheme.body17.copyWith(
                          color: state.selectedPeriod == ReportPeriod.monthly
                              ? Colors.white
                              : AppThemeConst.neutralColor1)),
                ),
              ),
            ),
          ),

          // Yearly Tab
          Flexible(
            child: GestureDetector(
              onTap: () {
                context.read<ReportCubit>().changePeriod(ReportPeriod.yearly);
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: BoxDecoration(
                  color: state.selectedPeriod == ReportPeriod.yearly
                      ? AppThemeConst.primaryColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Text(t.core.yearly,
                      style: context.textTheme.body17.copyWith(
                          color: state.selectedPeriod == ReportPeriod.yearly
                              ? Colors.white
                              : AppThemeConst.neutralColor1)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeRange(BuildContext context, ReportState state) {
    if (state.startDate == null || state.endDate == null) {
      return SizedBox.shrink();
    }

    String label;
    switch (state.selectedPeriod) {
      case ReportPeriod.weekly:
        final startLabel = DateFormat('MMM d').format(state.startDate!);
        final endLabel = DateFormat('MMM d, yyyy').format(state.endDate!);
        label = '$startLabel - $endLabel';
        break;
      case ReportPeriod.monthly:
        label = DateFormat('MMMM yyyy').format(state.startDate!);
        break;
      case ReportPeriod.yearly:
        label = DateFormat('yyyy').format(state.startDate!);
        break;
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              context.read<ReportCubit>().previousPeriod();
            },
            icon: Icon(Icons.chevron_left, color: AppThemeConst.neutralColor2),
          ),
          Expanded(
            child: Center(
              child: Text(
                label,
                style: context.textTheme.body17.copyWith(
                  color: AppThemeConst.neutralColor1,
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              context.read<ReportCubit>().nextPeriod();
            },
            icon: Icon(Icons.chevron_right, color: AppThemeConst.neutralColor2),
          ),
        ],
      ),
    );
  }
}
