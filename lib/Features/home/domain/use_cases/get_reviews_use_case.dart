import 'package:booki/Features/home/domain/repositories/home_repo.dart';
import 'package:booki/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

class GetReviewsUseCase {
  final HomeRepo homeRepo;

  GetReviewsUseCase(this.homeRepo);

  Future<Either<Failure, List<String>>> execute(String bookId) async {
    return await homeRepo.getReviews(bookId);
  }
}
