part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class RegisterClick extends RegisterEvent{
  final String firstName;
  final String lastName;
  final String phone;
  final String password;

  RegisterClick(this.firstName, this.lastName,this.phone,this.password);



}
