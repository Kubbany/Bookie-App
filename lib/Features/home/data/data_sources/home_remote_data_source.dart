import 'dart:developer';

import 'package:booki/Features/home/data/extenstions/book_mapper.dart';
import 'package:booki/Features/home/data/models/book_model.dart';
import 'package:booki/Features/home/domain/entites/book_entity.dart';
import 'package:booki/constatns.dart';
import 'package:booki/core/services/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchBooks();
  Future<void> submitRating(String bookId, String userId, double rating);
  Future<List<String>> getReviews(String bookId);
  Future<void> submitReview(String bookId, String userId, String review);
}

class HomeRemoteDataSourceImplementation extends HomeRemoteDataSource {
  final DatabaseService databaseService;
  HomeRemoteDataSourceImplementation(this.databaseService);
  @override
  Future<List<BookEntity>> fetchBooks() async {
    List<Map<String, dynamic>> data = await databaseService.getData(
      kBooks,
    );
    return await Future.wait(data.map((bookData) async {
      // Check if user has rated this book
      final userRating = await getUserRating(bookData['bookId']);
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

    // 2. Update ratings
    final userRatings = Map<String, double>.from(bookData!['userRatings'] ?? {});
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

  @override
  Future<List<String>> getReviews(String bookId) async {
    final bookData = await databaseService.getDataById(kBooks, bookId);
    return List<String>.from(bookData?['reviews'] ?? []);
  }

  @override
  Future<void> submitReview(String bookId, String userId, String review) async {
    final bookData = await databaseService.getDataById(kBooks, bookId);
    final currentReviews = List<String>.from(bookData?['reviews'] ?? []);
    currentReviews.add(review);
    log(currentReviews.length.toString());
    await databaseService.editData(
      kBooks,
      bookId,
      {'reviews': currentReviews},
    );
  }

  Future<double?> getUserRating(String bookId) async {
    final bookData = await databaseService.getDataById(kBooks, bookId);
    final ratings = bookData?['userRatings'] as Map<String, dynamic>? ?? {};
    return ratings[FirebaseAuth.instance.currentUser!.uid] as double?;
  }
}
