import 'package:booki/Features/home/domain/entites/book_entity.dart';
import 'package:booki/Features/home/domain/use_cases/fetch_books_use_case.dart';
import 'package:booki/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'books_state.dart';

class BooksCubit extends Cubit<BooksState> {
  BooksCubit(this.booksUseCase) : super(BooksInitial());
  final FetchBooksUseCase booksUseCase;
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
        emit(BooksSuccess(books: books));
      },
    );
  }
}
