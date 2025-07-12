import 'package:booki/Features/home/domain/entites/book_entity.dart';
import 'package:booki/Features/home/domain/repositories/home_repo.dart';
import 'package:booki/core/errors/failures.dart';
import 'package:booki/core/use_cases/no_pars_use_case.dart';
import 'package:dartz/dartz.dart';

class FetchBooksUseCase extends UseCase<List<BookEntity>> {
  final HomeRepo homeRepo;

  FetchBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> execute() async {
    return await homeRepo.fetchBooks();
  }
}
