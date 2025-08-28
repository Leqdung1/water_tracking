part of 'survey_cubit.dart';

class SurveyState extends Equatable {
  const SurveyState({
    this.step = 0,
    this.totalStep = 8,
    this.status = BlocStatus.initial,
    this.message = '',
    this.userInfo,
    this.water,
  });

  final int step;
  final int totalStep;
  final BlocStatus status;
  final String message;
  final UserInfoEntity? userInfo;
  final WaterEntity? water;


  SurveyState copyWith({
    int? step,
    int? totalStep,
    BlocStatus? status,
    String? message,
    UserInfoEntity? userInfo,
    WaterEntity? water,
  }) {
    return SurveyState(
      step: step ?? this.step,
      totalStep: totalStep ?? this.totalStep,
      status: status ?? this.status,
      message: message ?? this.message,
      userInfo: userInfo ?? this.userInfo,
      water: water ?? this.water,
    );
  }

  @override
  List<Object?> get props => [
        step,
        totalStep,
        status,
        message,
        userInfo,
        water,
      ];
}
