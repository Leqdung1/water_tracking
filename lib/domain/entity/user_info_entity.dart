import 'package:equatable/equatable.dart';
import 'package:water_tracking/core/enum/app_enum.dart';

class UserInfoEntity extends Equatable {
  final Gender gender;
  final double heightCm;
  final double weightKg;
  final int age;
  final DateTime timeWakeUp;
  final DateTime timeGoToBed;
  final ActivityLevel activityLevel;
  final Weather weather;
  final HeightUnit heightUnit;
  final WeightUnit weightUnit;

  const UserInfoEntity({
    required this.gender,
    required this.heightCm,
    required this.weightKg,
    required this.age,
    required this.timeWakeUp,
    required this.timeGoToBed,
    required this.activityLevel,
    required this.weather,
    required this.heightUnit,
    required this.weightUnit,
  });

  double get heightFt => heightCm / 30.48;

  double get weightLb => weightKg * 2.20462;

  UserInfoEntity copyWith({
    Gender? gender,
    double? heightCm,
    double? weightKg,
    int? age,
    DateTime? timeWakeUp,
    DateTime? timeGoToBed,
    ActivityLevel? activityLevel,
    Weather? weather,
    HeightUnit? heightUnit,
    WeightUnit? weightUnit,
  }) {
    return UserInfoEntity(
      gender: gender ?? this.gender,
      heightCm: heightCm ?? this.heightCm,
      weightKg: weightKg ?? this.weightKg,
      age: age ?? this.age,
      timeWakeUp: timeWakeUp ?? this.timeWakeUp,
      timeGoToBed: timeGoToBed ?? this.timeGoToBed,
      activityLevel: activityLevel ?? this.activityLevel,
      weather: weather ?? this.weather,
      heightUnit: heightUnit ?? this.heightUnit,
      weightUnit: weightUnit ?? this.weightUnit,
    );
  }

  @override
  List<Object?> get props => [
        gender,
        heightCm,
        weightKg,
        age,
        timeWakeUp,
        timeGoToBed,
        activityLevel,
        weather,
        heightUnit,
        weightUnit,
      ];
}
