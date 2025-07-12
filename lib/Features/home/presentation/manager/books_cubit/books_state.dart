part of 'books_cubit.dart';

@immutable
sealed class BooksState {}

final class BooksInitial extends BooksState {}

final class BooksLoading extends BooksState {}

final class BooksSuccess extends BooksState {
  final List<BookEntity> books;

  BooksSuccess({required this.books});
}

final class BooksFailure extends BooksState {
  final String errorMessage;

  BooksFailure({required this.errorMessage});
}

class BooksRatingSuccess extends BooksState {
  final List<BookEntity> books;

  BooksRatingSuccess({required this.books});
}
