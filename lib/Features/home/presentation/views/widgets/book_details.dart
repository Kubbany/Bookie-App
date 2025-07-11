import 'package:flutter/material.dart';

class BookDetails extends StatelessWidget {
  const BookDetails({
    super.key,
    required this.title,
    required this.author,
  });
  final String title, author;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        spacing: 6,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
              color: Colors.black,
            ),
          ),
          Text(
            author,
            style: TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w600,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
