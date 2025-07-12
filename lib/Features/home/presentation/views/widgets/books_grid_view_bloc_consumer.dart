import 'package:booki/Features/home/domain/entites/book_entity.dart';
import 'package:booki/Features/home/presentation/manager/books_cubit/books_cubit.dart';
import 'package:booki/Features/home/presentation/views/widgets/books_grid_view.dart';
import 'package:booki/core/utils/methods/show_snack_bar_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class BooksGirdViewBlocConsumer extends StatefulWidget {
  const BooksGirdViewBlocConsumer({
    super.key,
    required this.scrollController,
  });

  final ScrollController scrollController;

  @override
  State<BooksGirdViewBlocConsumer> createState() => _BooksGirdViewBlocConsumerState();
}

class _BooksGirdViewBlocConsumerState extends State<BooksGirdViewBlocConsumer> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BooksCubit, BooksState>(
      listener: (context, state) {
        if (state is BooksSuccess) {
          books = state.books;
        } else if (state is BooksPaginationFailure) {
          showSnackBarMessage(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        if (state is BooksSuccess || state is BooksRatingSuccess || state is BooksLoading) {
          return ModalProgressHUD(
            inAsyncCall: state is BooksLoading,
            progressIndicator: const CircularProgressIndicator(
              color: Color(0xFFFF7A00),
            ),
            child: BooksGridView(
              books: books,
              scrollController: widget.scrollController,
            ),
          );
        } else {
          return const Center(
            child: Text('An Error Occured, Please Try Again.'),
          );
        }
      },
    );
  }
}
