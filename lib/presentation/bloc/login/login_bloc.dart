import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:user_registration/domain/use_case/login_use_case.dart';

import '../../../domain/model/user_credential_model.dart';

part 'login_event.dart';
part 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase usecase;

  LoginBloc(this.usecase) : super(LoginInitial()) {
    on<TryLogin>(_mapEventToState);
  }

  void _mapEventToState(TryLogin event, Emitter<LoginState> emit) async {
    // ignore: unnecessary_type_check
    if (event is TryLogin) {
      final result = await usecase.execute(event.userCredentialModel);

      result.fold((left) => emit(LoginFailure(left.message.toString())),
          (right) => emit(LoginSuccess(right)));
    }
  }
}
