import 'package:booki/Features/authentication/presentation/managers/login_cubit/login_cubit.dart';
import 'package:booki/Features/authentication/presentation/views/widgets/login_to_register.dart';
import 'package:booki/Features/authentication/presentation/views/widgets/sign_in_form_section.dart';
import 'package:booki/Features/splash/presentation/views/widgets/text_logo.dart';
import 'package:booki/core/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 80,
            ),
            const TextLogo(fontSize: 64),
            const SizedBox(
              height: 35,
            ),
            const Text(
              "Sign In Your Account",
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 26,
            ),
            const SignInFormSection(),
            CustomButton(
              isLoading: false,
              title: "Sign In",
              titleSize: 18,
              buttonHeight: 50,
              onPressed: () {
                context.read<LoginCubit>().signInWithEmailAndPassword();
              },
              borderRadius: 8,
              backgroundColor: const Color(0xFFFF7A00),
            ),
            const SizedBox(
              height: 15,
            ),
            const LoginToRegister(),
          ],
        ),
      ),
    );
  }
}
