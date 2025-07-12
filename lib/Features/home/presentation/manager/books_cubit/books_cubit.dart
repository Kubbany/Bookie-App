import 'package:booki/Features/home/domain/entites/book_entity.dart';
import 'package:booki/Features/home/domain/use_cases/fetch_books_use_case.dart';
import 'package:booki/Features/home/domain/use_cases/submit_ratings_use_case.dart';
import 'package:booki/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'books_state.dart';

class BooksCubit extends Cubit<BooksState> {
  BooksCubit(this.booksUseCase, {this.submitRatingUseCase}) : super(BooksInitial());
  final FetchBooksUseCase booksUseCase;
  final SubmitRatingUseCase? submitRatingUseCase;
  List<BookEntity> booksList = [];
  Future<void> fetchBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(BooksLoading());
    } else {
      emit(BooksPaginationLoading());
    }

    Either<Failure, List<BookEntity>> result = await booksUseCase.execute(pageNumber);
    result.fold(
      (failure) {
        if (pageNumber == 0) {
          emit(BooksFailure(errorMessage: failure.errorMessage));
        } else {
          emit(BooksPaginationFailure(errorMessage: failure.errorMessage));
        }
      },
      (books) {
        booksList = books;
        emit(BooksSuccess(books: booksList));
      },
    );
  }

  Future<void> submitRating({
    required String bookId,
    required double rating,
  }) async {
    final result = await submitRatingUseCase!.execute(
      bookId: bookId,
      userId: FirebaseAuth.instance.currentUser!.uid,
      rating: rating,
    );

    result.fold(
      (failure) {
        emit(BooksFailure(errorMessage: failure.errorMessage));
      },
      (_) {
        fetchBooks(pageNumber: 0);
        emit(BooksRatingSuccess(books: booksList));
      },
    );
  }
}
