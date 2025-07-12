import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class BookEntity {
  @HiveField(0)
  final String bookId;
  @HiveField(1)
  final String? image;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String? authorName;
  @HiveField(4)
  final String category;
  @HiveField(5)
  final String url;
  @HiveField(6)
  final String pdf;
  @HiveField(7)
  final int? pageCount;
  @HiveField(8)
  final double avgRating;
  @HiveField(9)
  final List<String> reviews;
  @HiveField(10)
  final String readingStatus;

  BookEntity({
    required this.bookId,
    required this.image,
    required this.title,
    required this.authorName,
    required this.category,
    required this.url,
    required this.pdf,
    required this.pageCount,
    required this.avgRating,
    required this.reviews,
    required this.readingStatus,
  });
}
