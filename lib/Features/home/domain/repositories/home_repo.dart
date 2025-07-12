import 'package:booki/Features/home/domain/entites/book_entity.dart';
import 'package:booki/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchBooks({int pageNumber = 0});

  Future<Either<Failure, void>> submitRating(String bookId, String userId, double rating);
}
