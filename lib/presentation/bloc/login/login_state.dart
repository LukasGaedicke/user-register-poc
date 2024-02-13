part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginSuccess extends LoginState {
  final String uid;

  LoginSuccess(this.uid);
}

class LoginFailure extends LoginState {
  final String message;

  LoginFailure(this.message);
}
