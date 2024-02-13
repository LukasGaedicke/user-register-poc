import 'package:either_dart/either.dart';
import 'package:user_registration/domain/entities/user.dart';
import 'package:user_registration/domain/model/app_error.dart';

abstract class SignUpRepository {
  Future<Either<ErrorMessage, String>> signUp(UserDomain user);

  Future<Either<ErrorMessage, UserDomain>> fetchUser(String userId);
}
