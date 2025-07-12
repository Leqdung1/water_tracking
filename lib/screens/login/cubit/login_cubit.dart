import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/enum/app_enum.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  Future<void> login(String email, String password) async {
    emit(state.copyWith(status: BlocStatus.loading));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(state.copyWith(
        status: BlocStatus.success,
        email: email,
        password: password,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: BlocStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }
}
