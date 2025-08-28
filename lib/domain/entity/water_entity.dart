import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'water_entity.g.dart';

@HiveType(typeId: 1)
class WaterEntity extends Equatable {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final DateTime createdAt;
  @HiveField(2)
  final double totalWaterMl;
  @HiveField(3)
  final double targetWaterMl;

  const WaterEntity({
    required this.id,
    required this.createdAt,
    required this.totalWaterMl,
    required this.targetWaterMl,
  });

  double get totalWaterL => totalWaterMl / 1000;
  double get targetWaterL => targetWaterMl / 1000;

  WaterEntity copyWith({
    String? id,
    DateTime? createdAt,
    double? totalWaterMl,
    double? targetWaterMl,
  }) {
    return WaterEntity(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      totalWaterMl: totalWaterMl ?? this.totalWaterMl,
      targetWaterMl: targetWaterMl ?? this.targetWaterMl,
    );
  }

  @override
  List<Object?> get props => [
        id,
        createdAt,
        totalWaterMl,
        targetWaterMl,
      ];
}
