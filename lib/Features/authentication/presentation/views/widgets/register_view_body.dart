import 'package:booki/Features/authentication/presentation/views/widgets/continue_with_section.dart';
import 'package:booki/Features/authentication/presentation/views/widgets/register_to_login.dart';
import 'package:booki/Features/authentication/presentation/views/widgets/sign_up_form_section.dart';
import 'package:booki/Features/splash/presentation/views/widgets/text_logo.dart';
import 'package:flutter/material.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
        ),
        width: double.infinity,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            TextLogo(fontSize: 64),
            SizedBox(
              height: 35,
            ),
            Text(
              "Create an Account",
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 26,
            ),
            SignUpFormSection(),
            SizedBox(
              height: 15,
            ),
            ContinueWithSection(
              title: "Or sign up with",
            ),
            RegisterToLogin(),
          ],
        ),
      ),
    );
  }
}
