import 'package:booki/Features/home/data/extenstions/book_mapper.dart';
import 'package:booki/Features/home/data/models/book_model.dart';
import 'package:booki/Features/home/domain/entites/book_entity.dart';
import 'package:booki/constatns.dart';
import 'package:booki/core/services/database_service.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchBooks({int pageNumber = 0});
}

class HomeRemoteDataSourceImplementation extends HomeRemoteDataSource {
  final DatabaseService databaseService;
  HomeRemoteDataSourceImplementation(this.databaseService);
  @override
  Future<List<BookEntity>> fetchBooks({int pageNumber = 0}) async {
    List<Map<String, dynamic>> data = await databaseService.getData(
      kBooks,
    );
    List<BookEntity> books = data.map((json) {
      return BookModel.fromJson(json).toEntity();
    }).toList();
    //cacheData<BookEntity>(books, kFeaturedBooks);
    return books;
  }
}
