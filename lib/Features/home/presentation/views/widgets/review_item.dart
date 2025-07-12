import 'package:flutter/material.dart';

class ReviewItem extends StatelessWidget {
  final String review;

  const ReviewItem({
    super.key,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFFF7A00),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Text(
          review,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
