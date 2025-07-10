import 'package:booki/Features/home/data/models/book_model/book_model.dart';
import 'package:booki/Features/home/domain/entites/book_entity.dart';
import 'package:booki/Features/home/domain/repositories/home_repo.dart';
import 'package:booki/core/errors/failures.dart';
import 'package:booki/core/services/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiService apiService;

  HomeRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, List<BookEntity>>> fetchBooks({int pageNumber = 0}) async {
    try {
      var data = await apiService.get(
        endPoint: "volumes?Filtering=free-ebooks&q=fiction",
      );
      List<BookModel> books = [];
      for (var item in data["items"]) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } on DioException catch (e) {
      return left(
        ServerFailure.fromDioException(e),
      );
    } catch (e) {
      return left(
        ServerFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
