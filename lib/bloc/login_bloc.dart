import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_clean/repository/auth/login_repo.dart';
import 'package:flutter_bloc_clean/utils/enum.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepo loginRepo;
  LoginBloc(this.loginRepo) : super(const LoginState()) {
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

  Future<void> onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    final data = {'email': state.email, 'password': state.password};

    emit(state.copyWith(status: PostApiStatus.loading));

    try {
      final val = await loginRepo.loginApi(data);

      if (val.error.isNotEmpty) {
        emit(state.copyWith(status: PostApiStatus.failure, message: val.error));
      } else {
        emit(
          state.copyWith(
            status: PostApiStatus.success,
            message: "Login Successful",
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(status: PostApiStatus.failure, message: e.toString()),
      );
    }
  }
}
