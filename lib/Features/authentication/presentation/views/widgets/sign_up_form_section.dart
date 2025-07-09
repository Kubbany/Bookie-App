import 'package:booki/Features/authentication/presentation/managers/register_cubit/register_cubit.dart';
import 'package:booki/core/utils/app_validators.dart';
import 'package:booki/core/utils/widgets/custom_button.dart';
import 'package:booki/core/utils/widgets/custom_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpFormSection extends StatelessWidget {
  const SignUpFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<RegisterCubit>().formKey,
      autovalidateMode: context.read<RegisterCubit>().autovalidateMode,
      child: Column(
        children: <Widget>[
          CustomInputField(
            hint: "Enter Your Email",
            textEditingController: context.read<RegisterCubit>().email,
            validator: AppValidators.emailValidation,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomInputField(
            isPasswordField: true,
            hint: "Enter Your Password",
            textEditingController: context.read<RegisterCubit>().password,
            validator: AppValidators.passwordValidation,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomInputField(
            isPasswordField: true,
            hint: "Confirm Your Password",
            validator: (value) {
              return AppValidators.confirmPasswordValiation(
                value,
                context.read<RegisterCubit>().password.text,
              );
            },
          ),
          const SizedBox(
            height: 25,
          ),
          CustomButton(
            title: "Sign Up",
            titleSize: 18,
            buttonHeight: 50,
            onPressed: () {
              context.read<RegisterCubit>().createUserWithEmailAndPassword();
            },
            borderRadius: 8,
            backgroundColor: const Color(0xFFFF7A00),
          ),
        ],
      ),
    );
  }
}
