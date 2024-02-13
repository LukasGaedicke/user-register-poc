import 'package:either_dart/either.dart';
import 'package:user_registration/domain/entities/user.dart';
import 'package:user_registration/domain/model/app_error.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class UserRemoteDataSource {
  Future<Either<ErrorMessage, String>> signUp(UserDomain user);

  Future<Either<ErrorMessage, UserDomain>> fetchUser(String uid);
}

class UserRemoteDataSourceImpl extends UserRemoteDataSource {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<Either<ErrorMessage, String>> signUp(UserDomain user) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );

      String uidUser = userCredential.user!.uid;

      await firestore.collection('users').doc(uidUser).set({
        'uid': uidUser,
        'name': '${user.firstName} ${user.lastName}',
        'email': user.email,
        'password': user.password,
        'accessLevel': user.accessLevel,
      });
      return Right(uidUser);
    } catch (e) {
      return Left(ErrorMessage(key: AppError.NotFound, message: e.toString()));
    }
  }

  @override
  Future<Either<ErrorMessage, UserDomain>> fetchUser(String uid) async {
    try {
      DocumentSnapshot documentSnapshot =
          await firestore.collection('users').doc(uid).get();

      Map<String, dynamic> data =
          documentSnapshot.data() as Map<String, dynamic>;

      UserDomain user = UserDomain(
        firstName: data['name'].toString().split(' ')[0],
        lastName: data['name'].toString().split(' ')[1],
        email: data['email'],
        password: data['password'],
        accessLevel: data['accessLevel'],
      );
      return Right(user);
    } catch (e) {
      return const Left(ErrorMessage(
          key: AppError.NotFound, message: "Usuário não encontrado"));
    }
  }
}
