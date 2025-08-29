import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:water_tracking/domain/repository/water_repository.dart';

import '../../../../core/enum/app_enum.dart';
import '../../../../domain/entity/water_entity.dart';

part 'switch_cup_size_state.dart';

class SwitchCupSizeCubit extends Cubit<SwitchCupSizeState> {
  SwitchCupSizeCubit({this.waterRepository})
      : super(const SwitchCupSizeState());

  final WaterRepository? waterRepository;

  Future<void> changeCupSize(CupSize cupSize) async {
    emit(state.copyWith(
        water: state.water?.copyWith(cupSize: cupSize),
        status: BlocStatus.success));
    await saveCupSize(cupSize);
  }

  void changeTypeDrink(TypeDrink typeDrink) {
    emit(state.copyWith(
      water: state.water?.copyWith(typeDrink: typeDrink),
      status: BlocStatus.success,
    ));
  }

  Future<void> getWater() async {
    final water = await waterRepository?.getAll();
    emit(state.copyWith(water: water?.last));
  }

  Future<void> saveCupSize(CupSize cupSize) async {
    await waterRepository?.save(WaterEntity(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      createdAt: DateTime.now(),
      totalWaterMl: 0,
      targetWaterMl: 0,
      cupSize: cupSize,
    ));
  }
}
