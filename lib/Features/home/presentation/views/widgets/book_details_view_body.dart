import 'package:booki/Features/home/domain/entites/book_entity.dart';
import 'package:booki/Features/home/presentation/manager/books_cubit/books_cubit.dart';
import 'package:booki/Features/home/presentation/views/widgets/arrow_back_button.dart';
import 'package:booki/Features/home/presentation/views/widgets/book_actions.dart';
import 'package:booki/Features/home/presentation/views/widgets/details_view_book_info.dart';
import 'package:booki/Features/home/presentation/views/widgets/rating_actions.dart';
import 'package:booki/Features/home/presentation/views/widgets/reviews_list_view.dart';
import 'package:booki/Features/home/presentation/views/widgets/submit_review_section.dart';
import 'package:booki/core/utils/methods/show_snack_bar_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.book});
  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BooksCubit, BooksState>(
      listener: (context, state) {
        if (state is BooksSuccess) {
          showSnackBarMessage(context, "Rating Submitted Successfuly!");
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  spacing: 15,
                  children: <Widget>[
                    const ArrowBackButton(),
                    DetailsViewBookInfo(book: book),
                    RatingActions(
                      onRatingSelected: (rating) {
                        context.read<BooksCubit>().submitRating(
                              bookId: book.bookId,
                              rating: rating,
                            );
                      },
                      initialRating: book.userRatings[FirebaseAuth.instance.currentUser!.uid]?.toInt(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: BooksActions(
                        url: book.url,
                        pdf: book.pdf,
                      ),
                    ),
                    SubmitReviewSection(bookId: book.bookId),
                  ],
                ),
              ),
              const ReviewsListView(),
            ],
          ),
        );
      },
    );
  }
}
