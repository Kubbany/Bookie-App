import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.borderColor,
    this.titleColor,
    required this.borderRadius,
    required this.backgroundColor,
    this.titleSize,
    this.buttonHeight,
    this.borderSideWidth,
    this.isLoading = false,
  });

  final VoidCallback onPressed;
  final String title;
  final Color backgroundColor;
  final Color? borderColor;
  final Color? titleColor;
  final double borderRadius;
  final double? titleSize;
  final double? buttonHeight;
  final double? borderSideWidth;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: buttonHeight == null ? null : Size(double.infinity, buttonHeight!),
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          side: borderColor != null
              ? BorderSide(
                  color: borderColor!,
                  width: borderSideWidth ?? 2.5,
                )
              : BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: title.contains("Home")
            ? const EdgeInsets.symmetric(
                vertical: 15,
              )
            : EdgeInsets.zero,
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: titleSize,
                  color: titleColor ?? Colors.white,
                ),
              ),
      ),
    );
  }
}
