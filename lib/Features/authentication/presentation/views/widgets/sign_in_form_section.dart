import 'package:booki/Features/authentication/presentation/views/widgets/sign_in_actions_section.dart';
import 'package:booki/core/utils/app_validators.dart';
import 'package:booki/core/utils/widgets/custom_input_field.dart';
import 'package:flutter/material.dart';

class SignInFormSection extends StatelessWidget {
  const SignInFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          CustomInputField(
            hint: "Enter Your Email",
            textEditingController: TextEditingController(),
            validator: AppValidators.emailValidation,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomInputField(
            isPasswordField: true,
            hint: "Enter Your Password",
            textEditingController: TextEditingController(),
          ),
          const SizedBox(
            height: 10,
          ),
          const SignInActionsSection(),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
