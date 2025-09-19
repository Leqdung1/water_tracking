import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:water_tracking/domain/repository/water_repository.dart';

import '../../../../core/enum/app_enum.dart';
import '../../../../domain/entity/water_entity.dart';

part 'switch_cup_size_state.dart';

class SwitchCupSizeCubit extends Cubit<SwitchCupSizeState> {
  SwitchCupSizeCubit({WaterRepository? waterRepository})
      : _waterRepository = waterRepository ?? WaterRepository(),
        super(const SwitchCupSizeState());

  final WaterRepository _waterRepository;

  Future<void> changeCupSize(CupSize cupSize) async {
    try {
      // Update the state immediately for UI feedback
      emit(state.copyWith(
        water: state.water?.copyWith(cupSize: cupSize),
        status: BlocStatus.success,
      ));

      // Save to repository
      await saveCupSize(cupSize);
    } catch (e) {
      emit(state.copyWith(
        status: BlocStatus.error,
        message: e.toString(),
      ));
    }
  }

  Future<void> changeTypeDrink(TypeDrink typeDrink) async {
    try {
      // Update the state immediately for UI feedback
      emit(state.copyWith(
        water: state.water?.copyWith(typeDrink: typeDrink),
        status: BlocStatus.success,
      ));

      // Save to repository
      await saveTypeDrink(typeDrink);
    } catch (e) {
      emit(state.copyWith(
        status: BlocStatus.error,
        message: e.toString(),
      ));
    }
  }

  Future<void> getWater() async {
    try {
      final waterList = await _waterRepository.getAll();
      if (waterList.isNotEmpty) {
        emit(state.copyWith(
          water: waterList.last,
          status: BlocStatus.success,
        ));
      } else {
        emit(state.copyWith(
          water: null,
          status: BlocStatus.error,
          message: 'No water data found',
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        status: BlocStatus.error,
        message: e.toString(),
      ));
    }
  }

  Future<void> saveCupSize(CupSize cupSize) async {
    try {
      final waterList = await _waterRepository.getAll();
      final now = DateTime.now();

      // Find today's water entry
      WaterEntity? todayWater = waterList.where((water) {
        return _isSameDay(water.createdAt, now);
      }).firstOrNull;

      if (todayWater != null) {
        // Update today's entry with new cup size
        final updated = todayWater.copyWith(cupSize: cupSize);
        await _waterRepository.update(updated);
      } else {
        // No entry for today, create a new one
        final latest = waterList.isNotEmpty ? waterList.last : null;
        final newTodayWater = WaterEntity(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          createdAt: now,
          totalWaterMl: 0,
          targetWaterMl: latest?.targetWaterMl ?? 0,
          cupSize: cupSize,
          typeDrink: latest?.typeDrink,
        );
        await _waterRepository.save(newTodayWater);
      }
    } catch (e) {
      print('Error saving cup size: $e');
    }
  }

  Future<void> saveTypeDrink(TypeDrink typeDrink) async {
    try {
      final waterList = await _waterRepository.getAll();
      final now = DateTime.now();

      // Find today's water entry
      WaterEntity? todayWater = waterList.where((water) {
        return _isSameDay(water.createdAt, now);
      }).firstOrNull;

      if (todayWater != null) {
        // Update today's entry with new drink type
        final updated = todayWater.copyWith(typeDrink: typeDrink);
        await _waterRepository.update(updated);
      } else {
        // No entry for today, create a new one
        final latest = waterList.isNotEmpty ? waterList.last : null;
        final newTodayWater = WaterEntity(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          createdAt: now,
          totalWaterMl: 0,
          targetWaterMl: latest?.targetWaterMl ?? 0,
          cupSize: latest?.cupSize,
          typeDrink: typeDrink,
        );
        await _waterRepository.save(newTodayWater);
      }
    } catch (e) {
      print('Error saving drink type: $e');
    }
  }

  /// Helper method to check if two dates are the same day
  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }
}
