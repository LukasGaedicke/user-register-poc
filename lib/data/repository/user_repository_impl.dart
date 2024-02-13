import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:user_registration/data/datasources/remote_user_datasource.dart';
import 'package:user_registration/domain/model/app_error.dart';

import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';

@Injectable(as: SignUpRepository)
class SignUpRepositoryImpl extends SignUpRepository {
  late final UserRemoteDataSource userRemoteDataSource;

  @override
  Future<Either<ErrorMessage, String>> signUp(UserDomain user) {
    userRemoteDataSource = UserRemoteDataSourceImpl();
    return userRemoteDataSource.signUp(user);
  }

  @override
  Future<Either<ErrorMessage, UserDomain>> fetchUser(String userId) {
    userRemoteDataSource = UserRemoteDataSourceImpl();
    return userRemoteDataSource.fetchUser(userId);
  }
}
