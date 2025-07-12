class BookModel {
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
  final Map<String, double> userRatings;
  BookModel({
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
  });

  Map<String, dynamic> toJson() => {
        'bookId': bookId,
        'title': title,
        'image': image,
        'authorName': authorName,
        'category': category,
        'url': url,
        'pdf': pdf,
        'pageCount': pageCount,
        'reviews': reviews,
        'avgRating': avgRating,
        'readingStatus': readingStatus,
        'userRatings': userRatings,
      };

  factory BookModel.fromJson(Map<String, dynamic> map) {
    return BookModel(
      bookId: map['bookId'] as String,
      image: map['image'] as String?,
      title: map['title'] as String,
      authorName: map['authorName'] as String?,
      category: map['category'] as String,
      url: map['url'] as String,
      pdf: map['pdf'] as String,
      pageCount: map['pageCount'] as int?,
      avgRating: (map['avgRating'] as num).toDouble(), // Handle both int and double
      reviews: List<String>.from(
        map['reviews']?.map((item) => item.toString()) ?? [], // Handle null and dynamic types
      ),
      readingStatus: map['readingStatus'] as String,
      userRatings: Map<String, double>.from(map['userRatings'] ?? {}),
    );
  }
}
