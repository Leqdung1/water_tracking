part of 'survey_cubit.dart';

class SurveyState extends Equatable {
  const SurveyState({
    this.step = 0,
    this.totalStep = 8,
    this.status = BlocStatus.initial,
    this.message = '',
    this.gender,
  });

  final int step;
  final int totalStep;
  final BlocStatus status;
  final String message;
  final Gender? gender;

  SurveyState copyWith({
    int? step,
    int? totalStep,
    BlocStatus? status,
    String? message,
    Gender? gender,
  }) {
    return SurveyState(
      step: step ?? this.step,
      totalStep: totalStep ?? this.totalStep,
      status: status ?? this.status,
      message: message ?? this.message,
      gender: gender ?? this.gender,
    );
  }

  @override
  List<Object?> get props => [step, totalStep, status, message, gender];
}
