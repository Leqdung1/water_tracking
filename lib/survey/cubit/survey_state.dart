part of 'survey_cubit.dart';

class SurveyState extends Equatable {
  const SurveyState({
    this.step = 0,
    this.totalStep = 8,
    this.status = BlocStatus.initial,
    this.message = '',
    this.gender,
    this.heightCm,
    this.heightUnit = HeightUnit.cm,
    this.weightKg,
    this.weightUnit = WeightUnit.kg,
  });

  final int step;
  final int totalStep;
  final BlocStatus status;
  final String message;
  final Gender? gender;
  final int? heightCm; // stored in centimeters
  final HeightUnit heightUnit;
  final int? weightKg; // stored in kilograms
  final WeightUnit weightUnit;

  SurveyState copyWith({
    int? step,
    int? totalStep,
    BlocStatus? status,
    String? message,
    Gender? gender,
    int? heightCm,
    HeightUnit? heightUnit,
    int? weightKg,
    WeightUnit? weightUnit,
  }) {
    return SurveyState(
      step: step ?? this.step,
      totalStep: totalStep ?? this.totalStep,
      status: status ?? this.status,
      message: message ?? this.message,
      gender: gender ?? this.gender,
      heightCm: heightCm ?? this.heightCm,
      heightUnit: heightUnit ?? this.heightUnit,
      weightKg: weightKg ?? this.weightKg,
      weightUnit: weightUnit ?? this.weightUnit,
    );
  }

  @override
  List<Object?> get props => [
        step,
        totalStep,
        status,
        message,
        gender,
        heightCm,
        heightUnit,
        weightKg,
        weightUnit,
      ];
}
