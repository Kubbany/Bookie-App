import 'package:booki/Features/home/presentation/views/widgets/custom_book_actions_button.dart';
import 'package:booki/core/utils/methods/luanch_custom_url.dart';
import 'package:flutter/material.dart';

class BooksActions extends StatelessWidget {
  const BooksActions({
    super.key,
    required this.url,
    required this.pdf,
  });
  final String? url;
  final String? pdf;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: CustomBookActionsButton(
            onPressed: () {
              luanchCustomUrl(
                context,
                pdf,
              );
            },
            child: pdf == null ? "Unavailable" : "Free",
            textColor: Colors.black,
            backgroundColor: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
          ),
        ),
        Expanded(
          child: CustomBookActionsButton(
            onPressed: () {
              luanchCustomUrl(context, url);
            },
            child: url == null ? "Unavailable" : "Free Preview",
            fontSize: 16,
            textColor: Colors.white,
            backgroundColor: const Color(0xFFFF7A00),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
        ),
      ],
    );
  }
}
