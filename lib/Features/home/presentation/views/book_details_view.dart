import 'package:booki/Features/home/data/repositories/home_repo_impl.dart';
import 'package:booki/Features/home/domain/entites/book_entity.dart';
import 'package:booki/Features/home/domain/use_cases/get_reviews_use_case.dart';
import 'package:booki/Features/home/domain/use_cases/submit_review_use_case.dart';
import 'package:booki/Features/home/presentation/manager/reviews_cubit/reviews_cubit.dart';

import 'package:booki/Features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:booki/core/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final BookEntity book = GoRouterState.of(context).extra as BookEntity;

    return BlocProvider(
      create: (context) => ReviewsCubit(
        SubmitReviewUseCase(
          getIt.get<HomeRepoImpl>(),
        ),
        GetReviewsUseCase(
          getIt.get<HomeRepoImpl>(),
        ),
      )..getReviews(book.bookId),
      child: Scaffold(
        body: SafeArea(
          child: BookDetailsViewBody(
            book: book,
          ),
        ),
      ),
    );
  }
}
