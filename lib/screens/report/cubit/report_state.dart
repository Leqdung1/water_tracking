part of 'report_cubit.dart';
class ReportState extends Equatable {
  const ReportState({
    this.status = BlocStatus.initial,
    this.selectedPeriod = ReportPeriod.weekly,
    this.startDate,
    this.endDate,
    this.chartData = const [],
    this.drinkTypeChartData = const [],
    this.message,
  });

  final BlocStatus status;
  final ReportPeriod selectedPeriod;
  final DateTime? startDate;
  final DateTime? endDate;
  final List<ChartData> chartData;
  final List<ChartData> drinkTypeChartData;
  final String? message;

  ReportState copyWith({
    BlocStatus? status,
    ReportPeriod? selectedPeriod,
    DateTime? startDate,
    DateTime? endDate,
    List<ChartData>? chartData,
    List<ChartData>? drinkTypeChartData,
    String? message,
  }) {
    return ReportState(
      status: status ?? this.status,
      selectedPeriod: selectedPeriod ?? this.selectedPeriod,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      chartData: chartData ?? this.chartData,
      drinkTypeChartData: drinkTypeChartData ?? this.drinkTypeChartData,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [
        status,
        selectedPeriod,
        startDate,
        endDate,
        chartData,
        drinkTypeChartData,
        message,
      ];
}


