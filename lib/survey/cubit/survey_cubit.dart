import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../core/enum/app_enum.dart';
import '../../data/entity/user_info_entity.dart';

part 'survey_state.dart';

class SurveyCubit extends Cubit<SurveyState> {
  SurveyCubit() : super(const SurveyState());

  // --------------------------  STEP -------------------------- //
  void nextStep() {
    emit(state.copyWith(step: state.step + 1));
  }

  void previousStep() {
    emit(state.copyWith(step: state.step - 1));
  }

  void goToStep(int step) {
    emit(state.copyWith(step: step));
  }

  // --------------------------  USER INFO -------------------------- //

  void updateUserInfo({
    Gender? gender,
    HeightUnit? unit,
    double? heightCm,
    WeightUnit? weightUnit,
    double? weightKg,
    int? age,
    DateTime? timeWakeUp,
    ActivityLevel? activityLevel,
    Weather? weather,
  }) {
    emit(
      state.copyWith(
        userInfo: state.userInfo?.copyWith(
          gender: gender,
          heightUnit: unit,
          heightCm: heightCm,
          weightUnit: weightUnit,
          weightKg: weightKg,
          age: age,
          timeWakeUp: timeWakeUp,
          activityLevel: activityLevel,
          weather: weather,
        ),
      ),
    );
  }

  // --------------------------  WATER -------------------------- //
}
