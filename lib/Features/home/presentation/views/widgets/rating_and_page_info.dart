import 'package:booki/Features/home/presentation/views/widgets/info_item.dart';
import 'package:flutter/material.dart';

class RatingAndPageInfo extends StatelessWidget {
  final double rating;
  final int pageCount;

  const RatingAndPageInfo({
    super.key,
    required this.rating,
    required this.pageCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InfoItem(
            value: rating.toString(),
            label: "Rating",
          ),
          InfoItem(
            value: pageCount.toString(),
            label: "Number Of Page",
          ),
        ],
      ),
    );
  }
}
