part of 'login_bloc.dart';

class LoginState extends Equatable {
  final String email;
  final String password;
  final String message;
  final PostApiStatus status;

  const LoginState({
    this.email = '',
    this.password = '',
    this.message = '',
    this.status = PostApiStatus.initial,
  });

  LoginState copyWith({
    String? email,
    String? password,
    String? message,
    PostApiStatus? status,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      message: message ?? this.message,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [email, password, message, status];
}
