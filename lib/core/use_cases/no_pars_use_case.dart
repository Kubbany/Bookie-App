import 'package:booki/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<T> {
  Future<Either<Failure, T>> execute();
}
