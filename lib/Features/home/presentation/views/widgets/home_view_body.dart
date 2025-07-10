import 'package:booki/Features/home/presentation/manager/books_cubit/books_cubit.dart';
import 'package:booki/Features/home/presentation/views/widgets/books_grid_view_bloc_consumer.dart';
import 'package:booki/Features/home/presentation/views/widgets/home_view_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  late ScrollController scrollController;
  @override
  void initState() {
    super.initState();
    context.read<BooksCubit>().fetchBooks();
    scrollController = ScrollController();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HomeViewAppBar(),
        Expanded(
          child: BooksGirdViewBlocConsumer(scrollController: scrollController),
        ),
      ],
    );
  }
}
