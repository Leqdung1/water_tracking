import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:water_tracking/domain/entity/history_entity.dart';
import 'package:water_tracking/domain/repository/history_repository.dart';

import '../../../../core/enum/app_enum.dart';
import '../../../../domain/entity/water_entity.dart';
import '../../../../domain/repository/water_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({WaterRepository? waterRepository})
      : waterRepository = waterRepository ?? WaterRepository(),
        super(const HomeState());

  final WaterRepository waterRepository;
  final HistoryRepository historyRepository = HistoryRepository();

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

      final now = DateTime.now();

      // Find today's water entry
      WaterEntity? todayWater = waterList.where((water) {
        return _isSameDay(water.createdAt, now);
      }).firstOrNull;

      if (todayWater == null) {
        // No entry for today, create a new one based on the latest entry
        final latest = waterList.last;
        final newTodayWater = WaterEntity(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          createdAt: now,
          totalWaterMl: 0, // Start fresh for the new day
          targetWaterMl: latest.targetWaterMl, // Keep the same goal
          cupSize: latest.cupSize, // Keep the same cup size
          typeDrink: latest.typeDrink, // Keep the same drink type
        );

        await waterRepository.save(newTodayWater);

        emit(state.copyWith(
          status: BlocStatus.success,
          water: newTodayWater,
        ));
      } else {
        // Today's entry exists, use it (don't reset!)
        emit(state.copyWith(
          status: BlocStatus.success,
          water: todayWater,
        ));
      }
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

  /// Add water to today's total
  Future<void> addWater(int volumeMl) async {
    try {
      final current = state.water;
      if (current == null) return;

      final now = DateTime.now();

      // Create a new drink entry
      final drinkEntry = HistoryEntity(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        createdAt: now,
        volumeMl: volumeMl,
        date: now,
        cupSize: current.cupSize,
        typeDrink: current.typeDrink,
      );

      // Save the drink entry
      await historyRepository.save(drinkEntry);

      // Update the total water for the day
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

  /// Reset today's progress back to zero
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

  /// Helper method to check if two dates are the same day
  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }
}
