import 'package:booki/Features/home/presentation/manager/reviews_cubit/reviews_cubit.dart';
import 'package:booki/Features/home/presentation/views/widgets/review_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReviewsListView extends StatelessWidget {
  const ReviewsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewsCubit, ReviewsState>(
      builder: (context, state) {
        if (state is ReviewsSuccess) {
          if (state.reviews.isEmpty) {
            return const SliverToBoxAdapter(
              child: Center(
                child: Text(
                  "No Reviews  Yet",
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
              ),
            );
          }
          return SliverList.separated(
            itemCount: state.reviews.length,
            separatorBuilder: (context, index) => const SizedBox(
              height: 8,
            ),
            itemBuilder: (context, index) => ReviewItem(
              review: state.reviews[index],
            ),
          );
        } else if (state is ReviewsFailure) {
          return SliverToBoxAdapter(child: Text(state.errorMessage));
        } else {
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(
                color: Color(0xFFFF7A00),
              ),
            ),
          );
        }
      },
    );
  }
}
