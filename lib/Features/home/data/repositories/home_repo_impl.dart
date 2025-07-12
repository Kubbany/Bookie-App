import 'package:booki/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:booki/Features/home/domain/entites/book_entity.dart';
import 'package:booki/Features/home/domain/repositories/home_repo.dart';
import 'package:booki/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImpl({required this.homeRemoteDataSource});

  @override
  Future<Either<Failure, List<BookEntity>>> fetchBooks({int pageNumber = 0}) async {
    List<BookEntity> books = [];
    //List<BookEntity> books = homeLocalDataSource.fetchFeaturedBooks(pageNumber: pageNumber);
    if (books.isNotEmpty) {
      return right(books);
    } else {
      try {
        books = await homeRemoteDataSource.fetchBooks(pageNumber: pageNumber);
        return right(books);
      } catch (e) {
        if (e is DioException) {
          return left(ServerFailure.fromDioException(e));
        }
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, void>> submitRating(String bookId, String userId, double rating) async {
    try {
      await homeRemoteDataSource.submitRating(bookId, userId, rating);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
