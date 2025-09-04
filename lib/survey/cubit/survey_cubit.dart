import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../core/enum/app_enum.dart';
import '../../domain/entity/user_info_entity.dart';
import '../../domain/entity/water_entity.dart';
import '../../domain/repository/water_repository.dart';

part 'survey_state.dart';

class SurveyCubit extends Cubit<SurveyState> {
  SurveyCubit() : super(const SurveyState());

  final WaterRepository waterRepository = WaterRepository();

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
  Future<void> saveWater(double targetWaterMl) async {
    try {
      // Get recommended cup size based on water goal
      final recommendedCupSize = CupSize.getPrimaryCup(targetWaterMl);

      await waterRepository.save(WaterEntity(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        createdAt: DateTime.now(),
        targetWaterMl: targetWaterMl,
        totalWaterMl: 0,
        cupSize: recommendedCupSize,
      ));
      await getWater();
    } catch (e) {
      emit(state.copyWith(status: BlocStatus.error, message: e.toString()));
    }
  }

  Future<void> getWater() async {
    final water = await waterRepository.getAll();
    emit(state.copyWith(water: water.last));
  }
}
