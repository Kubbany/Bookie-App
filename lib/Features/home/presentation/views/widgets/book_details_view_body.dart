import 'package:booki/Features/home/domain/entites/book_entity.dart';
import 'package:booki/Features/home/presentation/views/widgets/book_actions.dart';
import 'package:booki/Features/home/presentation/views/widgets/book_card_image.dart';
import 'package:booki/Features/home/presentation/views/widgets/book_details.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: <Widget>[
        Align(
          alignment: Alignment.topLeft,
          child: IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.grey[700],
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.5,
          child: BookCardImage(image: book.image ?? ''),
        ),
        BookDetails(
          title: book.title,
          author: book.authorName ?? "Unknown Author",
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
      ],
    );
  }
}
