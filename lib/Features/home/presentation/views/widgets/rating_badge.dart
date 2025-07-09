import 'package:flutter/material.dart';

class RatingBadge extends StatelessWidget {
  final double rating;

  const RatingBadge({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF9E5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.star,
            size: 16,
            color: Color(0xFFB9CC00),
          ),
          const SizedBox(width: 4),
          Text(
            rating.toString(),
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFFB9CC00),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
