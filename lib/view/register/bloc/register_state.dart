part of 'register_bloc.dart';

enum RegisterStateEnum { loading, error, initial, success, message, noInternet }

class RegisterState {
  RegisterStateEnum stateEnum;
  String? error;
  String? message;

  RegisterState(
      {this.stateEnum = RegisterStateEnum.initial,
      this.error = "",
      this.message = ""});

  RegisterState copyWith(
      {RegisterStateEnum? stateEnum, String? error, String? message}) {
    return RegisterState(
      stateEnum: stateEnum ?? this.stateEnum,
      error: error ?? this.error,
      message: message ?? this.message,
    );
  }
}
