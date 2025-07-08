import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContinueWithItem extends StatelessWidget {
  const ContinueWithItem({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 25,
        child: SvgPicture.asset(image),
      ),
    );
  }
}
