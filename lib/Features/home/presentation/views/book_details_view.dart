import 'package:booki/Features/home/domain/entites/book_entity.dart';
import 'package:booki/Features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final BookEntity book = GoRouterState.of(context).extra as BookEntity;

    return Scaffold(
      body: SafeArea(
        child: BookDetailsViewBody(
          book: book,
        ),
      ),
    );
  }
}
