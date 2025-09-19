import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:water_tracking/core/enum/app_enum.dart';
import 'package:water_tracking/domain/entity/chart_data.dart';
import 'package:water_tracking/domain/entity/history_entity.dart';
import 'package:water_tracking/domain/repository/history_repository.dart';

part 'report_state.dart';

class ReportCubit extends Cubit<ReportState> {
  ReportCubit() : super(const ReportState());

  final HistoryRepository _historyRepository = HistoryRepository();

  /// Load report data for the selected period
  Future<void> loadReportData(ReportPeriod period, DateTime startDate) async {
    try {
      emit(state.copyWith(status: BlocStatus.loading));

      List<ChartData> chartData = [];
      List<ChartData> drinkTypeChartData = [];
      DateTime endDate;

      switch (period) {
        case ReportPeriod.weekly:
          endDate = startDate.add(const Duration(days: 6));
          chartData = await _getWeeklyData(startDate, endDate);
          drinkTypeChartData = await _getDrinkTypeData(startDate, endDate);
          break;
        case ReportPeriod.monthly:
          endDate = DateTime(startDate.year, startDate.month + 1, 0);
          chartData = await _getMonthlyData(startDate, endDate);
          drinkTypeChartData = await _getDrinkTypeData(startDate, endDate);
          break;
        case ReportPeriod.yearly:
          endDate = DateTime(startDate.year + 1, 1, 0);
          chartData = await _getYearlyData(startDate, endDate);
          drinkTypeChartData = await _getDrinkTypeData(startDate, endDate);
          break;
      }

      emit(state.copyWith(
        status: BlocStatus.success,
        selectedPeriod: period,
        startDate: startDate,
        endDate: endDate,
        chartData: chartData,
        drinkTypeChartData: drinkTypeChartData,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: BlocStatus.error,
        message: e.toString(),
      ));
    }
  }

  /// Get drink type data aggregated for the period
  Future<List<ChartData>> _getDrinkTypeData(
      DateTime startDate, DateTime endDate) async {
    final Map<TypeDrink?, double> drinkTypeTotals = {};

    // Initialize all drink types with 0
    for (TypeDrink type in TypeDrink.values) {
      drinkTypeTotals[type] = 0;
    }
    // Add null for water without specific type
    drinkTypeTotals[null] = 0;

    // Iterate through each day in the period
    DateTime currentDate = startDate;
    while (currentDate.isBefore(endDate.add(const Duration(days: 1)))) {
      final entries = await _historyRepository.getByDate(currentDate);

      for (HistoryEntity entry in entries) {
        final drinkType = entry.typeDrink;
        drinkTypeTotals[drinkType] =
            (drinkTypeTotals[drinkType] ?? 0) + entry.volumeMl;
      }

      currentDate = currentDate.add(const Duration(days: 1));
    }

    // Convert to ChartData list, filtering out zero values
    final List<ChartData> chartData = [];

    for (MapEntry<TypeDrink?, double> entry in drinkTypeTotals.entries) {
      if (entry.value > 0) {
        final drinkType = entry.key;
        final label = drinkType?.name ?? 'Water';
        chartData.add(ChartData(
          label: label,
          value: entry.value,
          tooltipLabel: '${label}: ${entry.value.toInt()} mL',
        ));
      }
    }

    // Sort by value (highest first)
    chartData.sort((a, b) => b.value.compareTo(a.value));

    return chartData;
  }

  /// Get weekly data (7 days)
  Future<List<ChartData>> _getWeeklyData(
      DateTime startDate, DateTime endDate) async {
    final List<ChartData> data = [];

    for (int i = 0; i < 7; i++) {
      final currentDate = startDate.add(Duration(days: i));
      final entries = await _historyRepository.getByDate(currentDate);

      final totalWater =
          entries.fold<double>(0, (sum, entry) => sum + entry.volumeMl);

      data.add(ChartData(
        label: '${i + 1}', // Day 1, 2, 3, etc.
        value: totalWater,
        tooltipLabel: _formatDate(currentDate),
      ));
    }

    return data;
  }

  /// Get monthly data (last 30 days or current month days)
  Future<List<ChartData>> _getMonthlyData(
      DateTime startDate, DateTime endDate) async {
    final List<ChartData> data = [];
    final daysInMonth = endDate.day;

    for (int i = 0; i < daysInMonth; i++) {
      final currentDate = startDate.add(Duration(days: i));
      final entries = await _historyRepository.getByDate(currentDate);

      final totalWater =
          entries.fold<double>(0, (sum, entry) => sum + entry.volumeMl);

      data.add(ChartData(
        label: '${i + 1}', // Day 1, 2, 3, etc.
        value: totalWater,
        tooltipLabel: _formatDate(currentDate),
      ));
    }

    return data;
  }

  /// Get yearly data (12 months)
  Future<List<ChartData>> _getYearlyData(
      DateTime startDate, DateTime endDate) async {
    final List<ChartData> data = [];

    for (int i = 0; i < 12; i++) {
      final currentMonth = DateTime(startDate.year, startDate.month + i, 1);
      final monthEnd = DateTime(currentMonth.year, currentMonth.month + 1, 0);

      double totalWater = 0;

      // Sum all days in the month
      for (int day = 1; day <= monthEnd.day; day++) {
        final currentDate =
            DateTime(currentMonth.year, currentMonth.month, day);
        final entries = await _historyRepository.getByDate(currentDate);
        totalWater +=
            entries.fold<double>(0, (sum, entry) => sum + entry.volumeMl);
      }

      data.add(ChartData(
        label: '${i + 1}', // Month 1, 2, 3, etc.
        value: totalWater,
        tooltipLabel: _formatMonth(currentMonth),
      ));
    }

    return data;
  }

  /// Navigate to previous period
  void previousPeriod() {
    if (state.startDate == null) return;

    DateTime newStartDate;
    switch (state.selectedPeriod) {
      case ReportPeriod.weekly:
        newStartDate = state.startDate!.subtract(const Duration(days: 7));
        break;
      case ReportPeriod.monthly:
        newStartDate =
            DateTime(state.startDate!.year, state.startDate!.month - 1, 1);
        break;
      case ReportPeriod.yearly:
        newStartDate = DateTime(state.startDate!.year - 1, 1, 1);
        break;
    }

    loadReportData(state.selectedPeriod, newStartDate);
  }

  /// Navigate to next period
  void nextPeriod() {
    if (state.startDate == null) return;

    DateTime newStartDate;
    switch (state.selectedPeriod) {
      case ReportPeriod.weekly:
        newStartDate = state.startDate!.add(const Duration(days: 7));
        break;
      case ReportPeriod.monthly:
        newStartDate =
            DateTime(state.startDate!.year, state.startDate!.month + 1, 1);
        break;
      case ReportPeriod.yearly:
        newStartDate = DateTime(state.startDate!.year + 1, 1, 1);
        break;
    }

    loadReportData(state.selectedPeriod, newStartDate);
  }

  /// Change period type
  void changePeriod(ReportPeriod period) {
    if (state.startDate == null) {
      // Initialize with current week/month/year
      DateTime startDate;
      switch (period) {
        case ReportPeriod.weekly:
          final now = DateTime.now();
          startDate = now.subtract(Duration(days: now.weekday - 1));
          break;
        case ReportPeriod.monthly:
          startDate = DateTime(DateTime.now().year, DateTime.now().month, 1);
          break;
        case ReportPeriod.yearly:
          startDate = DateTime(DateTime.now().year, 1, 1);
          break;
      }
      loadReportData(period, startDate);
    } else {
      loadReportData(period, state.startDate!);
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  String _formatMonth(DateTime date) {
    return '${date.month}/${date.year}';
  }
}

enum ReportPeriod {
  weekly,
  monthly,
  yearly,
}
