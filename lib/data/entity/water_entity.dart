import 'package:equatable/equatable.dart';

class WaterEntity extends Equatable {
  final String id;
  final DateTime date;
  final double totalWaterMl;
  final double targetWaterMl;

  const WaterEntity({
    required this.id,
    required this.date,
    required this.totalWaterMl,
    required this.targetWaterMl,
  });

  double get totalWaterL => totalWaterMl / 1000;
  double get targetWaterL => targetWaterMl / 1000;

  WaterEntity copyWith({
    String? id,
    DateTime? date,
    double? totalWaterMl,
    double? targetWaterMl,
  }) {
    return WaterEntity(
      id: id ?? this.id,
      date: date ?? this.date,
      totalWaterMl: totalWaterMl ?? this.totalWaterMl,
      targetWaterMl: targetWaterMl ?? this.targetWaterMl,
    );
  }

  @override
  List<Object?> get props => [
        id,
        date,
        totalWaterMl,
        targetWaterMl,
      ];
}
