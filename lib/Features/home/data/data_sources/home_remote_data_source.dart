import 'package:booki/Features/home/data/extenstions/book_mapper.dart';
import 'package:booki/Features/home/data/models/book_model.dart';
import 'package:booki/Features/home/domain/entites/book_entity.dart';
import 'package:booki/constatns.dart';
import 'package:booki/core/services/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchBooks({int pageNumber = 0});
  Future<void> submitRating(String bookId, String userId, double rating);
}

class HomeRemoteDataSourceImplementation extends HomeRemoteDataSource {
  final DatabaseService databaseService;
  HomeRemoteDataSourceImplementation(this.databaseService);
  @override
  Future<List<BookEntity>> fetchBooks({int pageNumber = 0}) async {
    List<Map<String, dynamic>> data = await databaseService.getData(
      kBooks,
    );
    return await Future.wait(data.map((bookData) async {
      // Check if user has rated this book
      final userRating = await _getUserRating(bookData['bookId']);
      return BookModel.fromJson({
        ...bookData,
        'userRating': userRating, // Include user's rating
      }).toEntity();
    }));
  }

  @override
  Future<void> submitRating(String bookId, String userId, double rating) async {
    // 1. Get current book data
    final bookData = await databaseService.getDataById(kBooks, bookId);
    if (bookData == null) throw Exception('Book not found');

    // 2. Update ratings
    final userRatings = Map<String, double>.from(bookData['userRatings'] ?? {});
    userRatings[userId] = rating;

    // 3. Calculate new average
    final avgRating = userRatings.values.reduce((a, b) => a + b) / userRatings.length;

    // 4. Update using generic editData
    await databaseService.editData(
      kBooks,
      bookId,
      {
        'userRatings': userRatings,
        'avgRating': avgRating,
      },
    );
  }

  Future<double?> _getUserRating(String bookId) async {
    final bookData = await databaseService.getDataById(kBooks, bookId);
    final ratings = bookData?['userRatings'] as Map<String, dynamic>? ?? {};
    return ratings[FirebaseAuth.instance.currentUser!.uid] as double?;
  }
}
