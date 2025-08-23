part of 'survey_cubit.dart';

class SurveyState extends Equatable {
  const SurveyState({
    this.step = 0,
    this.totalStep = 8,
    this.status = BlocStatus.initial,
    this.message = '',
    this.userInfo,
  });

  final int step;
  final int totalStep;
  final BlocStatus status;
  final String message;
  final UserInfoEntity? userInfo;


  SurveyState copyWith({
    int? step,
    int? totalStep,
    BlocStatus? status,
    String? message,
    UserInfoEntity? userInfo,
  }) {
    return SurveyState(
      step: step ?? this.step,
      totalStep: totalStep ?? this.totalStep,
      status: status ?? this.status,
      message: message ?? this.message,
      userInfo: userInfo ?? this.userInfo,
    );
  }

  @override
  List<Object?> get props => [
        step,
        totalStep,
        status,
        message,
        userInfo,
      ];
}
