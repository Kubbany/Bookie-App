import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 35,
      backgroundColor: Color(0xFFFF7A00),
      child: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.white,
        child: Icon(
          Icons.person,
          size: 40,
          color: Color(0xFFFF7A00),
        ),
      ),
    );
  }
}
