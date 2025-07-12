import 'package:booki/Features/home/domain/entites/book_entity.dart';
import 'package:booki/Features/home/domain/repositories/home_repo.dart';
import 'package:booki/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

class FetchBooksUseCase {
  final HomeRepo homeRepo;

  FetchBooksUseCase(this.homeRepo);

  Future<Either<Failure, List<BookEntity>>> execute() async {
    return await homeRepo.fetchBooks();
  }
}
