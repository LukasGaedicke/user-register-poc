import 'package:either_dart/either.dart';
import 'package:user_registration/data/repository/login_repository_impl.dart';
import 'package:user_registration/domain/model/app_error.dart';
import 'package:user_registration/domain/model/user_credential_model.dart';
import 'package:user_registration/domain/repositories/login_repository.dart';
import 'package:user_registration/domain/use_case/use_case.dart';

class LoginUseCase extends UseCase<String, UserCredentialModel> {
  @override
  Future<Either<ErrorMessage, String>> execute(UserCredentialModel params) {
    LoginRepository loginRepository = LoginRepositoryImpl();
    return loginRepository.login(params);
  }
}
