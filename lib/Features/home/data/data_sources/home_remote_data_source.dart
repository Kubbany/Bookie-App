import 'package:booki/Features/home/data/models/book_model/book_model.dart';
import 'package:booki/Features/home/domain/entites/book_entity.dart';
import 'package:booki/core/services/api_service.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0});
}

class HomeRemoteDataSourceImplementation extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImplementation(this.apiService);
  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0}) async {
    Map<String, dynamic> data = await apiService.get(
      endPoint: "volumes?Filtering=free-ebooks&q=programming&startIndex=${pageNumber * 10}",
    );
    List<BookEntity> books = getBooksList(data);
    //cacheData<BookEntity>(books, kFeaturedBooks);
    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var bookMap in data["items"]) {
      books.add(BookModel.fromJson(bookMap));
    }
    return books;
  }
}
