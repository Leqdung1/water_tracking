import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_cubit_state.dart';

class AppCubitCubit extends Cubit<AppCubitState> {
  AppCubitCubit() : super(const AppCubitState());
}
