import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextLogo extends StatelessWidget {
  const TextLogo({super.key, required this.fontSize});
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: GoogleFonts.poppins(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
        children: const [
          TextSpan(
            text: 'B',
            style: TextStyle(color: Colors.black),
          ),
          TextSpan(
            text: 'O',
            style: TextStyle(color: Colors.black),
          ),
          TextSpan(
            text: 'O',
            style: TextStyle(color: Color(0xFFFF7A00)),
          ),
          TextSpan(
            text: 'K',
            style: TextStyle(color: Color(0xFFFF7A00)),
          ),
          TextSpan(
            text: 'I',
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
