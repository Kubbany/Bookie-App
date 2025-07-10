import 'package:flutter/material.dart';

class BookCardImage extends StatelessWidget {
  const BookCardImage({
    super.key,
    required this.image,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: AspectRatio(
        aspectRatio: 0.7,
        child: Image.network(
          image,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
