import 'package:booki/core/utils/widgets/custom_password_field.dart';
import 'package:booki/core/utils/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField({
    super.key,
    required this.hint,
    this.verticalContentPadding,
    this.keyboardType,
    this.validator,
    this.isPasswordField = false,
    this.textEditingController,
  });
  final String hint;
  final TextEditingController? textEditingController;
  final double? verticalContentPadding;
  final bool isPasswordField;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        isPasswordField
            ? CustomPasswordField(
                textEditingController: textEditingController,
                fillColor: Colors.white,
                validator: validator,
                hintText: hint,
              )
            : CustomTextFormField(
                prefixIcon: Icons.email,
                textEditingController: textEditingController,
                keyboardType: keyboardType,
                fillColor: Colors.white,
                validator: validator,
                hintText: hint,
                verticalContentPadding: verticalContentPadding,
              ),
      ],
    );
  }
}
