import 'package:flutter/material.dart';

class RatingActions extends StatefulWidget {
  final void Function(double) onRatingSelected;
  final int? initialRating;
  const RatingActions({super.key, required this.onRatingSelected, this.initialRating});

  @override
  State<RatingActions> createState() => _RatingActionsState();
}

class _RatingActionsState extends State<RatingActions> {
  int? selectedIndex;
  @override
  void initState() {
    super.initState();
    if (widget.initialRating != null) {
      selectedIndex = widget.initialRating! - 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
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
        children: List.generate(
          5,
          (index) {
            final rating = index + 1;
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                backgroundColor: selectedIndex == index ? Colors.blue : const Color(0xFFCC9C00),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(12),
                elevation: 2,
              ),
              onPressed: () {
                selectedIndex = index;
                setState(() {});
                widget.onRatingSelected(rating.toDouble());
              },
              child: Text(
                rating.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            );
          },
        ),
      ),
    );
  }
}
