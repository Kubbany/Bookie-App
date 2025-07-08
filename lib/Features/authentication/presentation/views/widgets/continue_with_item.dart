import 'package:flutter/material.dart';

class ContinueWithItem extends StatelessWidget {
  const ContinueWithItem({super.key, required this.icon});
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: CircleAvatar(
        backgroundColor: const Color(0xff131925),
        radius: 25,
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
