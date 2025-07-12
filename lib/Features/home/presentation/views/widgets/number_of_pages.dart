import 'package:booki/Features/home/presentation/views/widgets/info_item.dart';
import 'package:flutter/material.dart';

class NumberOfPagesWidget extends StatelessWidget {
  final int pageCount;

  const NumberOfPagesWidget({
    super.key,
    required this.pageCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
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
      child: Center(
        child: InfoItem(
          value: pageCount.toString(),
          label: "Number Of Pages",
        ),
      ),
    );
  }
}
