import 'package:booki/Features/home/data/models/book_model.dart';
import 'package:booki/Features/home/domain/entites/book_entity.dart';

extension BookMapper on BookModel {
  BookEntity toEntity() => BookEntity(
        bookId: bookId,
        image: image,
        title: title,
        authorName: authorName,
        category: category,
        url: url,
        pdf: pdf,
        pageCount: pageCount,
        avgRating: avgRating,
        reviews: reviews,
        readingStatus: readingStatus,
      );
}
