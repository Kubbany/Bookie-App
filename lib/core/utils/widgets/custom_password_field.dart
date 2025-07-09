import 'package:flutter/material.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({
    super.key,
    required this.hintText,
    this.textEditingController,
    this.validator,
    this.fillColor,
  });
  final String hintText;
  final Color? fillColor;
  final TextEditingController? textEditingController;
  final String? Function(String?)? validator;
  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
      controller: widget.textEditingController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return "This Filed Cannot Be Empty";
            }
            return null;
          },
      obscureText: !isVisible,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.lock_rounded,
          color: Colors.grey,
        ),
        filled: true,
        fillColor: widget.fillColor ?? const Color(0xff101825),
        contentPadding: const EdgeInsets.only(
          top: 12,
          left: 16,
          right: 16,
          bottom: 12,
        ),
        enabledBorder: buildBorder(),
        errorBorder: buildBorder(color: Colors.red),
        focusedBorder: buildBorder(
          color: Colors.blue,
        ),
        focusedErrorBorder: buildBorder(
          color: Colors.red,
        ),
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          fontSize: 16,
          color: Colors.grey,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            isVisible = !isVisible;
            setState(() {});
          },
          icon: Icon(
            isVisible != true ? Icons.visibility_off : Icons.visibility,
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: BorderSide(
        color: color ?? Colors.transparent,
      ),
    );
  }
}
