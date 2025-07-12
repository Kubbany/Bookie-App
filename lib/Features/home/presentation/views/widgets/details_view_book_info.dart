import 'package:booki/Features/home/domain/entites/book_entity.dart';
import 'package:booki/Features/home/presentation/views/widgets/book_card_image.dart';
import 'package:booki/Features/home/presentation/views/widgets/book_details.dart';
import 'package:booki/Features/home/presentation/views/widgets/number_of_pages.dart';
import 'package:flutter/material.dart';

class DetailsViewBookInfo extends StatelessWidget {
  const DetailsViewBookInfo({super.key, required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      children: <Widget>[
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.33,
          child: BookCardImage(image: book.image ?? ''),
        ),
        BookDetails(
          title: book.title,
          author: book.authorName ?? "Unknown Author",
        ),
        NumberOfPagesWidget(
          pageCount: book.pageCount!,
        ),
      ],
    );
  }
}
