part of 'login_cubit.dart';

class LoginState extends Equatable {
  final BlocStatus status;
  final String? errorMessage;
  final String? email;
  final String? password;

  const LoginState({
    this.status = BlocStatus.initial,
    this.errorMessage,
    this.email,
    this.password,
  });

  LoginState copyWith({
    BlocStatus? status,
    String? errorMessage,
    String? email,
    String? password,
  }) {
    return LoginState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object?> get props => [
        status,
        errorMessage,
        email,
        password,
      ];
}
