// features/home/domain/use_cases/submit_rating_use_case.dart
import 'package:booki/core/errors/failures.dart';
import 'package:booki/Features/home/domain/repositories/home_repo.dart';
import 'package:dartz/dartz.dart';

class SubmitRatingUseCase {
  final HomeRepo homeRepo;

  SubmitRatingUseCase(this.homeRepo);

  Future<Either<Failure, void>> execute({
    required String bookId,
    required String userId,
    required double rating,
  }) async {
    return await homeRepo.submitRating(
      bookId,
      userId,
      rating,
    );
  }
}
