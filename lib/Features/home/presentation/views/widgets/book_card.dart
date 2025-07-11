import 'package:booki/Features/home/domain/entites/book_entity.dart';
import 'package:booki/Features/home/presentation/views/widgets/book_card_image.dart';
import 'package:booki/Features/home/presentation/views/widgets/book_info.dart';
import 'package:booki/core/utils/app_router.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookCard extends StatelessWidget {
  const BookCard({
    super.key,
    required this.book,
  });
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView, extra: book);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 0.7,
              child: BookCardImage(
                image: book.image ?? '',
              ),
            ),
            const Flexible(
              child: SizedBox(
                height: 10,
              ),
            ),
            BookInfo(
              book: book,
            ),
          ],
        ),
      ),
    );
  }
}
