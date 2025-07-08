import 'package:booki/core/utils/app_validators.dart';
import 'package:booki/core/utils/widgets/custom_button.dart';
import 'package:booki/core/utils/widgets/custom_input_field.dart';
import 'package:flutter/material.dart';

class SignUpFormSection extends StatelessWidget {
  const SignUpFormSection({super.key});

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
            validator: AppValidators.passwordValidation,
          ),
          const SizedBox(
            height: 20,
          ),
          const CustomInputField(
            isPasswordField: true,
            hint: "Confirm Your Password",
            // validator: (value) {
            //   // return AppValidators.confirmPasswordValiation(
            //   //   value,
            //   //   context.read<RegisterCubit>().password.text,
            //   // );
            // },
          ),
          const SizedBox(
            height: 25,
          ),
          CustomButton(
            title: "Sign Up",
            titleSize: 18,
            buttonHeight: 50,
            onPressed: () {},
            borderRadius: 8,
            backgroundColor: const Color(0xFFFF7A00),
          ),
        ],
      ),
    );
  }
}
