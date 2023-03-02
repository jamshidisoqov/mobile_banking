part of 'login_bloc.dart';

enum LoginStateEnum { loading, error, initial, success,message,noInternet }

class LoginState {
  LoginStateEnum stateEnum;
  String? error;
  String? message;

  LoginState(
      {this.stateEnum = LoginStateEnum.initial,
      this.error = "",
      this.message = ""});

  LoginState copyWith(
      {LoginStateEnum? stateEnum, String? error, String? message}) {
    return LoginState(
      stateEnum: stateEnum ?? this.stateEnum,
      error: error ?? this.error,
      message: message ?? this.message,
    );
  }
}
