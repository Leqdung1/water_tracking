part of 'history_cubit.dart';

class HistoryState extends Equatable {
  final BlocStatus status;
  final String? message;
  final List<HistoryEntity> drinkEntries;
  final DateTime? selectedDate;

  const HistoryState({
    this.status = BlocStatus.initial,
    this.message,
    this.drinkEntries = const [],
    this.selectedDate,
  });

  HistoryState copyWith({
    BlocStatus? status,
    String? message,
    List<HistoryEntity>? drinkEntries,
    DateTime? selectedDate,
  }) {
    return HistoryState(
      status: status ?? this.status,
      message: message ?? this.message,
      drinkEntries: drinkEntries ?? this.drinkEntries,
      selectedDate: selectedDate ?? this.selectedDate,
    );
  }

  @override
  List<Object?> get props => [status, message, drinkEntries, selectedDate];
}
