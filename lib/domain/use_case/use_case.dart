import 'package:either_dart/either.dart';
import 'package:user_registration/domain/model/app_error.dart';

abstract class UseCase<Type, Params> {
  Future<Either<ErrorMessage, dynamic>> execute(Params params);
}
