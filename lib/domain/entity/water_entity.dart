import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

import '../../core/enum/app_enum.dart';

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
  @HiveField(4)
  final CupSize? cupSize;
  @HiveField(5)
  final TypeDrink? typeDrink;

  const WaterEntity({
    required this.id,
    required this.createdAt,
    required this.totalWaterMl,
    required this.targetWaterMl,
    this.cupSize,
    this.typeDrink,
  });

  double get totalWaterL => totalWaterMl / 1000;
  double get targetWaterL => targetWaterMl / 1000;

  WaterEntity copyWith({
    String? id,
    DateTime? createdAt,
    double? totalWaterMl,
    double? targetWaterMl,
    CupSize? cupSize,
    TypeDrink? typeDrink,
  }) {
    return WaterEntity(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      totalWaterMl: totalWaterMl ?? this.totalWaterMl,
      targetWaterMl: targetWaterMl ?? this.targetWaterMl,
      cupSize: cupSize ?? this.cupSize,
      typeDrink: typeDrink ?? this.typeDrink,
    );
  }

  @override
  List<Object?> get props => [
        id,
        createdAt,
        totalWaterMl,
        targetWaterMl,
        cupSize,
        typeDrink,
      ];
}
