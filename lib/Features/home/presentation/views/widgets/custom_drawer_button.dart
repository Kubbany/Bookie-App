import 'package:booki/core/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class CustomDrawerButton extends StatelessWidget {
  const CustomDrawerButton({super.key, required this.title, required this.onPressed});
  final String title;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: CustomButton(
        title: title,
        titleSize: 18,
        onPressed: onPressed,
        borderRadius: 8,
        backgroundColor: const Color(0xFFFF7A00),
        buttonHeight: 50,
      ),
    );
  }
}
