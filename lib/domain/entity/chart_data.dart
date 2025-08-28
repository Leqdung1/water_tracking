class ChartData {
  final String label;
  final double value;
  final double? value2;
  final double? value3;
  final double? value4;
  final String? tooltipLabel;

  ChartData({
    required this.label,
    required this.value,
    this.value2,
    this.value3,
    this.value4,
    this.tooltipLabel,
  });
}
