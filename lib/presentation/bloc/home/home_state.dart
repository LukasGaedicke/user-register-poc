part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeSuccess extends HomeState {
  final UserDomain user;

  HomeSuccess(this.user);
}

class HomeFailure extends HomeState {
  final String message;

  HomeFailure(this.message);
}

class HomeLoading extends HomeState {}
