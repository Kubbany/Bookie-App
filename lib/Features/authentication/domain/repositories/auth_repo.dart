import 'package:booki/Features/authentication/domain/entites/user_entity.dart';
import 'package:booki/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(String email, String password);
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(String email, String password);
}
