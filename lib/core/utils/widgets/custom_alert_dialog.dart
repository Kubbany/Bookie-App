import 'dart:io';

import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({super.key, required this.title, required this.content, required this.onAgree});
  final String title, content;
  final VoidCallback onAgree;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            onAgree();
          },
          child: const Text("Try Again"),
        ),
        TextButton(
          onPressed: () => exit(0),
          child: const Text("Cancel"),
        ),
      ],
    );
  }
}
