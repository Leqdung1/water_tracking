part of 'switch_cup_size_cubit.dart';

class SwitchCupSizeState extends Equatable {
  final BlocStatus status;
  final String? message;
  final WaterEntity? water;

  const SwitchCupSizeState({
    this.status = BlocStatus.initial,
    this.message,
    this.water,
  });

  SwitchCupSizeState copyWith({
    BlocStatus? status,
    String? message,
    WaterEntity? water,
  }) {
    return SwitchCupSizeState(
      status: status ?? this.status,
      message: message ?? this.message,
      water: water ?? this.water,
    );
  }

  @override
  List<Object?> get props => [status, message, water];
}

