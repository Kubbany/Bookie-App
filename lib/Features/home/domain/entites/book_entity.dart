class BookEntity {
  final String bookId;

  final String? image;

  final String title;

  final String? authorName;

  final String category;

  final String url;

  final String pdf;

  final int? pageCount;

  final double avgRating;

  final List<String> reviews;

  final String readingStatus;
  final Map<String, double?> userRatings;
  final double? userRating;

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
    required this.userRatings,
    required this.userRating,
  });

  BookEntity copyWith({
    String? bookId,
    String? image,
    String? title,
    String? authorName,
    String? category,
    String? url,
    String? pdf,
    int? pageCount,
    double? avgRating,
    List<String>? reviews,
    String? readingStatus,
    double? userRating,
  }) {
    return BookEntity(
      bookId: bookId ?? this.bookId,
      image: image ?? this.image,
      title: title ?? this.title,
      authorName: authorName ?? this.authorName,
      category: category ?? this.category,
      url: url ?? this.url,
      pdf: pdf ?? this.pdf,
      pageCount: pageCount ?? this.pageCount,
      avgRating: avgRating ?? this.avgRating,
      reviews: reviews ?? this.reviews,
      readingStatus: readingStatus ?? this.readingStatus,
      userRatings: userRatings,
      userRating: userRating ?? this.userRating,
    );
  }
}
