import 'package:booki/Features/home/domain/repositories/home_repo.dart';
import 'package:booki/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

class SubmitReviewUseCase {
  final HomeRepo homeRepo;

  SubmitReviewUseCase(this.homeRepo);

  Future<Either<Failure, void>> execute({
    required String bookId,
    required String userId,
    required String review,
  }) async {
    return await homeRepo.submitReview(bookId, userId, review);
  }
}
