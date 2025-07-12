part of 'reviews_cubit.dart';

@immutable
sealed class ReviewsState {}

final class ReviewsInitial extends ReviewsState {}

final class ReviewsLoading extends ReviewsState {}

final class ReviewsFailure extends ReviewsState {
  final String errorMessage;

  ReviewsFailure({required this.errorMessage});
}

class ReviewsSuccess extends ReviewsState {
  final List<String> reviews;

  ReviewsSuccess({required this.reviews});
}

class ReviewCreatedSuccess extends ReviewsState {}

class ReviewCreatedFailure extends ReviewsState {
  final String errorMessage;

  ReviewCreatedFailure({required this.errorMessage});
}
