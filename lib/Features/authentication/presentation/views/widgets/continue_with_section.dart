import 'package:booki/Features/authentication/presentation/views/widgets/continue_with_list.dart';
import 'package:flutter/material.dart';

class ContinueWithSection extends StatelessWidget {
  const ContinueWithSection({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        const ContinueWithList(),
      ],
    );
  }
}
