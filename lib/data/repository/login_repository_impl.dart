import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:user_registration/data/datasources/remote_login_datasource.dart';
import 'package:user_registration/domain/model/app_error.dart';
import 'package:user_registration/domain/model/user_credential_model.dart';
import '../../domain/repositories/login_repository.dart';

@Injectable(as: LoginRepository)
class LoginRepositoryImpl extends LoginRepository {
  late final LoginRemoteDataSource loginRemoteDataSource;

  @override
  Future<Either<ErrorMessage, String>> login(
      UserCredentialModel userCredentialModel) {
    loginRemoteDataSource = LoginRemoteDataSourceImpl();
    return loginRemoteDataSource
        .signInWithEmailAndPassword(userCredentialModel);
  }
}
