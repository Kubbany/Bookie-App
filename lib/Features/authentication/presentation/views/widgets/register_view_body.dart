import 'package:booki/Features/authentication/presentation/views/widgets/register_to_login.dart';
import 'package:booki/Features/authentication/presentation/views/widgets/sign_up_form_section.dart';
import 'package:booki/Features/splash/presentation/views/widgets/text_logo.dart';
import 'package:flutter/material.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 18,
        ),
        child: Column(
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
            RegisterToLogin(),
          ],
        ),
      ),
    );
  }
}
