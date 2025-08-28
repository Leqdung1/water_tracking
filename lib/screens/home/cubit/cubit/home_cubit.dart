import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/enum/app_enum.dart';
import '../../../../domain/entity/water_entity.dart';
import '../../../../domain/repository/water_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  final WaterRepository waterRepository = WaterRepository();

  Future<void> getWater() async {
    try {
      final water = await waterRepository.getAll();
      emit(state.copyWith(
        status: BlocStatus.success,
        water: water.last,
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
