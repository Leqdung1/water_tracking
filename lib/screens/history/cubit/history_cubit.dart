import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:water_tracking/core/enum/app_enum.dart';
import 'package:water_tracking/domain/entity/history_entity.dart';
import 'package:water_tracking/domain/repository/history_repository.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit() : super(const HistoryState());

  final HistoryRepository historyRepository = HistoryRepository();

  Future<void> getDrinkEntriesForDate(DateTime date) async {
    try {
      emit(state.copyWith(status: BlocStatus.loading));

      final entries = await historyRepository.getByDate(date);

      // Sort by time (most recent first)
      entries.sort((a, b) => b.createdAt.compareTo(a.createdAt));

      emit(state.copyWith(
        status: BlocStatus.success,
        drinkEntries: entries,
        selectedDate: date,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: BlocStatus.error,
        message: e.toString(),
      ));
    }
  }

  Future<void> refreshEntries() async {
    if (state.selectedDate != null) {
      await getDrinkEntriesForDate(state.selectedDate!);
    }
  }
}
