part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class GetHomeInformationEvent extends HomeEvent {
  final String uid;
  GetHomeInformationEvent(this.uid);
}

class LogoutEvent extends HomeEvent {
  LogoutEvent();
}
