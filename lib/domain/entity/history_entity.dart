
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:water_tracking/core/enum/app_enum.dart';

part 'history_entity.g.dart';

@HiveType(typeId: 3)
class HistoryEntity extends Equatable {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final DateTime createdAt;
  @HiveField(2)
  final int volumeMl;
  @HiveField(3)
  final CupSize? cupSize;
  @HiveField(4)
  final TypeDrink? typeDrink;
  @HiveField(5)
  final DateTime date; // The date this drink was consumed

  const HistoryEntity({
    required this.id,
    required this.createdAt,
    required this.volumeMl,
    required this.date,
    this.cupSize,
    this.typeDrink,
  });

  HistoryEntity copyWith({
    String? id,
    DateTime? createdAt,
    int? volumeMl,
    DateTime? date,
    CupSize? cupSize,
    TypeDrink? typeDrink,
  }) {
    return HistoryEntity(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      volumeMl: volumeMl ?? this.volumeMl,
      date: date ?? this.date,
      cupSize: cupSize ?? this.cupSize,
      typeDrink: typeDrink ?? this.typeDrink,
    );
  }

  @override
  List<Object?> get props => [
        id,
        createdAt,
        volumeMl,
        date,
        cupSize,
        typeDrink,
      ];
}