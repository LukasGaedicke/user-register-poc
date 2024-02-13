part of 'sing_up_bloc.dart';

@immutable
abstract class SignUp {}

class SignUpEvent extends SignUp {
  final UserDomain user;

  SignUpEvent(this.user);
}
