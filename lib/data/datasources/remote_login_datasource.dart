import 'package:user_registration/domain/model/app_error.dart';
import 'package:user_registration/domain/model/user_credential_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:either_dart/either.dart';

abstract class LoginRemoteDataSource {
  Future<Either<ErrorMessage, String>> signInWithEmailAndPassword(
      UserCredentialModel userCredential);
}

class LoginRemoteDataSourceImpl extends LoginRemoteDataSource {
  @override
  Future<Either<ErrorMessage, String>> signInWithEmailAndPassword(
      UserCredentialModel userCredential) async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    try {
      var authUser = await auth.signInWithEmailAndPassword(
        email: userCredential.email,
        password: userCredential.password,
      );

      String userUID = authUser.user!.uid.toString();

      return Right(userUID);
    } on FirebaseAuthException catch (_) {
      String code = _.code;
      String message = _.message.toString();

      if (code == 'user-not-found' || code == 'wrong-password') {
        return const Left(ErrorMessage(
            key: AppError.NotFound, message: "Senha ou e-mail incorretos"));
      }
      return Left(
          ErrorMessage(key: AppError.NotFound, message: message.toString()));
    }
  }
}
