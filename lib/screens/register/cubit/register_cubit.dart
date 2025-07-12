import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/enum/app_enum.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(const RegisterState());

  Future<void> register(String email, String password, String confirmPassword) async {
    emit(state.copyWith(status: BlocStatus.loading));
    try {
      if (!passwordConfirm(password, confirmPassword)) {
        emit(state.copyWith(
            status: BlocStatus.error,
            errorMessage: 'Password and confirm password do not match'));
        return;
      }
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
        
      );
      emit(state.copyWith(
        status: BlocStatus.success,
        email: email,
        password: password,
      ));
    } catch (e) {
      emit(
        state.copyWith(status: BlocStatus.error, errorMessage: e.toString()),
      );
    }
  }

  bool passwordConfirm(String password, String confirmPassword) {
    return password == confirmPassword;
  }
}
