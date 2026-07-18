import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_clean/repository/auth/login_repo.dart';
import 'package:flutter_bloc_clean/utils/enum.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepo loginRepo = LoginRepo();
  LoginBloc() : super(const LoginState()) {
    on<EmailChanged>(onEmailChanged);
    on<PasswordChanged>(onPasswordChanged);
    on<PasswordUnfocused>(onPasswordUnfocused);
    on<LoginSubmitted>(onLoginSubmitted);
  }

  void onEmailChanged(EmailChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    debugPrint("Password: ${event.password}");
    emit(state.copyWith(password: event.password));
  }

  void onPasswordUnfocused(PasswordUnfocused event, Emitter<LoginState> emit) {
    // Handle password unfocused event if needed
  }

  void onLoginSubmitted(LoginSubmitted event, Emitter<LoginState> emit) {
    Map<String, String> data = {
      'email': state.email,
      'password': state.password,
    };
    // Map<String, String> data = {
    //   'email': "eve.holt@reqres.in",
    //   'password': "pistol"
    // };
    emit(state.copyWith(status: PostApiStatus.loading));

    loginRepo
        .loginApi(data)
        .then((val) {
          if (val.error.isNotEmpty) {
            emit(
              state.copyWith(
                status: PostApiStatus.success,
                message: "Login Successfully",
              ),
            );
          } else {
            emit(
              state.copyWith(
                status: PostApiStatus.failure,
                message: "Login Failed",
              ),
            );
          }
        })
        .onError((error, stackTrace) {
          emit(
            state.copyWith(
              status: PostApiStatus.failure,
              message: error.toString(),
            ),
          );
        });
  }
}
