import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/enum/app_enum.dart';
import '../../../../domain/entity/water_entity.dart';
import '../../../../domain/repository/water_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  final WaterRepository waterRepository = WaterRepository();

  /// Load the latest daily water entry (from survey or last session)
  Future<void> getWater() async {
    try {
      final waterList = await waterRepository.getAll();

      if (waterList.isEmpty) {
        emit(state.copyWith(
          status: BlocStatus.error,
          water: null,
          message: 'No daily goal found. Please complete the survey first.',
        ));
        return;
      }

      final latest = waterList.last;
      emit(state.copyWith(
        status: BlocStatus.success,
        water: latest,
      ));
    } catch (e) {
      emit(
        state.copyWith(
          status: BlocStatus.error,
          message: e.toString(),
        ),
      );
    }
  }

  /// Select a preferred cup size (used for quick-add button)
  void setCupSize(CupSize cupSize) {
    emit(state.copyWith(cupSize: cupSize));
  }

  /// Add water to today’s total
  Future<void> addWater(int volumeMl) async {
    try {
      final current = state.water;
      if (current == null) return;

      final updated = current.copyWith(
        totalWaterMl: current.totalWaterMl + volumeMl,
      );

      await waterRepository.update(updated);

      emit(state.copyWith(
        status: BlocStatus.success,
        water: updated,
      ));
    } catch (e) {
      emit(
        state.copyWith(
          status: BlocStatus.error,
          message: e.toString(),
        ),
      );
    }
  }

  /// Reset today’s progress back to zero
  Future<void> resetToday() async {
    try {
      final current = state.water;
      if (current == null) return;

      final reset = current.copyWith(totalWaterMl: 0);
      await waterRepository.update(reset);

      emit(state.copyWith(
        status: BlocStatus.success,
        water: reset,
      ));
    } catch (e) {
      emit(
        state.copyWith(
          status: BlocStatus.error,
          message: e.toString(),
        ),
      );
    }
  }
}

