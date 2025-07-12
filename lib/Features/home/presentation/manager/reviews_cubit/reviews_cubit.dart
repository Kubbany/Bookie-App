import 'package:booki/Features/home/domain/use_cases/get_reviews_use_case.dart';
import 'package:booki/Features/home/domain/use_cases/submit_review_use_case.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'reviews_state.dart';

class ReviewsCubit extends Cubit<ReviewsState> {
  ReviewsCubit(this.submitReviewUseCase, this.getReviewsUseCase) : super(ReviewsInitial());
  final SubmitReviewUseCase submitReviewUseCase;
  final GetReviewsUseCase getReviewsUseCase;
  final TextEditingController review = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final userId = FirebaseAuth.instance.currentUser!.uid;

  Future<void> submitReview(String bookId) async {
    emit(ReviewsLoading());
    final result = await submitReviewUseCase.execute(
      bookId: bookId,
      userId: userId,
      review: review.text,
    );
    result.fold(
      (failure) => emit(ReviewCreatedFailure(errorMessage: failure.errorMessage)),
      (_) {
        emit(
          ReviewCreatedSuccess(),
        );
        getReviews(bookId);
      }, // Refresh after review
    );
  }

  Future<void> getReviews(String bookId) async {
    emit(ReviewsLoading());
    final result = await getReviewsUseCase.execute(bookId);
    result.fold(
      (failure) => emit(ReviewsFailure(errorMessage: failure.errorMessage)),
      (reviews) {
        emit(ReviewsSuccess(reviews: reviews));
      },
    );
  }

  @override
  Future<void> close() {
    review.dispose();
    return super.close();
  }
}
