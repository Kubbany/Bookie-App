import 'package:booki/core/utils/app_validators.dart';
import 'package:booki/core/utils/widgets/custom_button.dart';
import 'package:booki/core/utils/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15,
      children: <Widget>[
        CustomTextFormField(
          hintText: "Leave Your Review",
          verticalContentPadding: 90,
          fillColor: Colors.white,
          borderColor: Colors.grey,
          borderRadius: 10,
          textEditingController: TextEditingController(),
          validator: AppValidators.requiredField,
        ),
        CustomButton(
          title: "Submit",
          titleSize: 18,
          onPressed: () {},
          borderRadius: 8,
          backgroundColor: const Color(0xFFFF7A00),
          buttonHeight: 50,
        ),
      ],
    );
  }
}
