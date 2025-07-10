import 'package:booki/Features/authentication/data/models/user_model.dart';
import 'package:booki/Features/authentication/domain/entites/user_entity.dart';
import 'package:booki/Features/authentication/domain/repositories/auth_repo.dart';
import 'package:booki/core/errors/exceptions.dart';
import 'package:booki/core/errors/failures.dart';
import 'package:booki/core/services/firebase_auth_service.dart';
import 'package:dartz/dartz.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImpl({required this.firebaseAuthService});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(String email, String password) async {
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(email: email, password: password);

      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(errorMessage: e.errorMessage));
    } catch (e) {
      return left(const ServerFailure(errorMessage: 'An Error Occured, Please Try Again'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(String email, String password) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(email: email, password: password);

      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(errorMessage: e.errorMessage));
    } catch (e) {
      return left(const ServerFailure(errorMessage: 'An Error Occured, Please Try Again'));
    }
  }
}
