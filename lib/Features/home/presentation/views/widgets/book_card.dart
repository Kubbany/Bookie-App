import 'package:booki/Features/home/presentation/views/widgets/book_card_image.dart';
import 'package:booki/Features/home/presentation/views/widgets/book_info.dart';

import 'package:booki/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  const BookCard({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Column(
        children: [
          BookCardImage(
            image: Assets.imagesTestImage,
          ),
          Flexible(
            child: SizedBox(
              height: 10,
            ),
          ),
          BookInfo(),
        ],
      ),
    );
  }
}
