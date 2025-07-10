import 'package:booki/Features/home/domain/entites/book_entity.dart';
import 'package:booki/Features/home/presentation/manager/books_cubit/books_cubit.dart';
import 'package:booki/Features/home/presentation/views/widgets/book_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksGridView extends StatefulWidget {
  const BooksGridView({
    super.key,
    required this.books,
    required this.scrollController,
  });

  final List<BookEntity> books;
  final ScrollController scrollController;

  @override
  State<BooksGridView> createState() => _BooksGridViewState();
}

class _BooksGridViewState extends State<BooksGridView> {
  bool isLoading = false;
  int nextPage = 1;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_onScroll);
  }

  void _onScroll() async {
    double currentPosition = widget.scrollController.position.pixels;
    double maxScrollExtent = widget.scrollController.position.maxScrollExtent;
    if (currentPosition >= maxScrollExtent * 0.7) {
      if (!isLoading) {
        isLoading = true;
        await context.read<BooksCubit>().fetchBooks(pageNumber: nextPage++);
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScroll);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: widget.books.length,
      controller: widget.scrollController,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(
        vertical: 25,
        horizontal: 16,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 15,
        childAspectRatio: 0.5,
      ),
      itemBuilder: (context, index) => BookCard(
        book: widget.books[index],
      ),
    );
  }
}
