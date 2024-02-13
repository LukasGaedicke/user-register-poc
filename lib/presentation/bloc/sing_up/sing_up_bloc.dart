import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:user_registration/domain/entities/user.dart';

import '../../../domain/use_case/sing_up_use_case.dart';

part 'sing_up_event.dart';
part 'sing_up_state.dart';

@injectable
class SignUpBloc extends Bloc<SignUp, SignUpState> {
  final SignUpUseCase singInUseCase;

  SignUpBloc(this.singInUseCase) : super(SignUpInitial()) {
    on<SignUpEvent>(_mapEventToState);
  }

  void _mapEventToState(SignUp event, Emitter<SignUpState> emit) async {
    if (event is SignUpEvent) {
      final result = await singInUseCase.execute(event.user);
      result.fold((left) => emit(SignUpFailure(left.message)),
          (right) => emit(SignUpSuccess(right)));
    }
  }
}
