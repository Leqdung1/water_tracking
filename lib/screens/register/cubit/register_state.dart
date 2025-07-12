part of 'register_cubit.dart';

class RegisterState extends Equatable {
  final BlocStatus status;
  final String? errorMessage;
  final String email;
  final String password;
  final String confirmPassword;
  const RegisterState({
    this.status = BlocStatus.initial,
    this.errorMessage,
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
  });

  RegisterState copyWith({
    BlocStatus? status,
    String? errorMessage,
    String? email,
    String? password,
    String? confirmPassword,
  }) {
    return RegisterState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }

  @override
  List<Object?> get props => [
        status,
        errorMessage,
        email,
        password,
        confirmPassword,
      ];
}
