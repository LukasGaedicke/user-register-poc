import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:user_registration/domain/entities/user.dart';
import 'package:user_registration/domain/use_case/get_user_use_case.dart';

part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetUserUseCase usecase;

  HomeBloc(this.usecase) : super(HomeInitial()) {
    on<GetHomeInformationEvent>(_mapEventToState);
  }

  void _mapEventToState(HomeEvent event, Emitter<HomeState> emit) async {
    if (event is GetHomeInformationEvent) {
      final result = await usecase.execute(event.uid);
      result.fold((left) => emit(HomeFailure(left.message.toString())),
          (right) {
        emit(HomeSuccess(right));
      });
    }
  }
}
