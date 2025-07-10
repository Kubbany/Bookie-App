import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.leading,
    required this.trailingIcon,
    required this.trailingOnPressed,
  });
  final Widget leading;
  final IconData trailingIcon;
  final VoidCallback trailingOnPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        leading,
        IconButton(
          onPressed: trailingOnPressed,
          icon: Icon(
            trailingIcon,
            size: 30,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }
}
