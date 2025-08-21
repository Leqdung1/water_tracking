import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../core/enum/app_enum.dart';

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
    emit(state.copyWith(gender: gender));
  }
}
