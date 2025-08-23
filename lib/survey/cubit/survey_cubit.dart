import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../core/enum/app_enum.dart';
import '../../data/entity/user_info_entity.dart';

part 'survey_state.dart';

class SurveyCubit extends Cubit<SurveyState> {
  SurveyCubit() : super(const SurveyState());

  void nextStep() {
    emit(state.copyWith(step: state.step + 1));
  }

  void previousStep() {
    emit(state.copyWith(step: state.step - 1));
  }

  void goToStep(int step) {
    emit(state.copyWith(step: step));
  }

  void updateGender(Gender gender) {
    emit(state.copyWith(userInfo: state.userInfo?.copyWith(gender: gender)));
  }

  void updateHeightUnit(HeightUnit unit) {
    emit(state.copyWith(userInfo: state.userInfo?.copyWith(heightUnit: unit)));
  }

  void updateHeightCm(double heightCm) {
    emit(state.copyWith(userInfo: state.userInfo?.copyWith(heightCm: heightCm)));
  }

  void updateWeightUnit(WeightUnit unit) {
    emit(state.copyWith(userInfo: state.userInfo?.copyWith(weightUnit: unit)));
  }

  void updateWeightKg(double weightKg) {
    emit(state.copyWith(userInfo: state.userInfo?.copyWith(weightKg: weightKg)));
  }

  void updateAge(int age) {
    emit(state.copyWith(userInfo: state.userInfo?.copyWith(age: age)));
  }

  void updateTimeWakeUp(DateTime timeWakeUp) {
    emit(state.copyWith(userInfo: state.userInfo?.copyWith(timeWakeUp: timeWakeUp)));
  }

}
