part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginClick extends LoginEvent{
  final String phone;
  final String password;

  LoginClick(this.phone, this.password);
}

