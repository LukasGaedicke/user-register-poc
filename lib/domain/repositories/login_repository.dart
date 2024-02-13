import 'package:either_dart/either.dart';
import 'package:user_registration/domain/model/app_error.dart';
import 'package:user_registration/domain/model/user_credential_model.dart';

abstract class LoginRepository {
  Future<Either<ErrorMessage, String>> login(
      UserCredentialModel userCredentialModel);
}
