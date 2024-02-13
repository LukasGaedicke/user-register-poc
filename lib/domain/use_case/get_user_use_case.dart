import 'package:either_dart/either.dart';
import 'package:user_registration/data/repository/user_repository_impl.dart';
import 'package:user_registration/domain/entities/user.dart';
import 'package:user_registration/domain/model/app_error.dart';
import 'package:user_registration/domain/repositories/user_repository.dart';
import 'package:user_registration/domain/use_case/use_case.dart';

class GetUserUseCase extends UseCase<UserDomain, String> {
  @override
  Future<Either<ErrorMessage, UserDomain>> execute(String params) {
    SignUpRepository signUpRepository = SignUpRepositoryImpl();
    return signUpRepository.fetchUser(params);
  }
}
