part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class TryLogin extends LoginEvent {
  final UserCredentialModel userCredentialModel;

  TryLogin(this.userCredentialModel);
}
