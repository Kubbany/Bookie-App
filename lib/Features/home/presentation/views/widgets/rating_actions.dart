import 'package:flutter/material.dart';

class RatingActions extends StatelessWidget {
  final void Function(int) onRatingSelected;

  const RatingActions({super.key, required this.onRatingSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(20),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        spacing: 0,
        children: List.generate(5, (index) {
          final rating = index + 1;
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor: const Color(0xFFCC9C00), // Golden color
              foregroundColor: Colors.white,
              padding: const EdgeInsets.all(12),
              elevation: 2,
            ),
            onPressed: () => onRatingSelected(rating),
            child: Text(
              rating.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          );
        }),
      ),
    );
  }
}
