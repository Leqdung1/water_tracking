import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/enum/app_enum.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(const RegisterState());
}
