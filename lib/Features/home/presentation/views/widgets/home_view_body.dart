import 'package:booki/Features/home/presentation/manager/books_cubit/books_cubit.dart';
import 'package:booki/Features/home/presentation/views/widgets/books_grid_view_bloc_consumer.dart';
import 'package:booki/Features/home/presentation/views/widgets/filter_actions.dart';
import 'package:booki/Features/home/presentation/views/widgets/home_view_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  List<String> categories = [];
  final List<double> ratings = [1, 2, 3, 4, 5];

  @override
  void initState() {
    super.initState();
    context.read<BooksCubit>().fetchBooks();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BooksCubit, BooksState>(
      listener: (context, state) {
        if (state is BooksSuccess && categories.isEmpty) {
          categories = state.books.map((e) => e.category).toSet().toList()..sort();
          setState(() {});
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HomeViewAppBar(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
            child: FilterActions(
              categories: categories,
              ratings: ratings,
              onFilter: (category, rating) {
                context.read<BooksCubit>().filterBooks(
                      category: category,
                      rating: rating,
                    );
              },
              onClear: () {
                context.read<BooksCubit>().clearFilters();
              },
            ),
          ),
          const Expanded(
            child: BooksGirdViewBlocConsumer(),
          ),
        ],
      ),
    );
  }
}
