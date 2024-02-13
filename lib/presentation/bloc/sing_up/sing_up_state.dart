part of 'sing_up_bloc.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpSuccess extends SignUpState {
  final String uid;

  SignUpSuccess(this.uid);
}

class SignUpFailure extends SignUpState {
  final String errorMessage;

  SignUpFailure(this.errorMessage);
}
