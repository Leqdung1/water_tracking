part of 'home_cubit.dart';

class HomeState extends Equatable {
  final BlocStatus status;
  final String? message;
  final WaterEntity? water;

  const HomeState({
    this.status = BlocStatus.initial,
    this.message,
    this.water,
  });

  HomeState copyWith({
    BlocStatus? status,
    String? message,
    WaterEntity? water,
  }) {
    return HomeState(
      status: status ?? this.status,
      message: message ?? this.message,
      water: water ?? this.water,
    );
  }

  @override
  List<Object?> get props => [status, message, water];
}
