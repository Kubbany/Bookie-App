import 'package:booki/Features/authentication/presentation/views/widgets/remember_me.dart';
import 'package:flutter/material.dart';

class SignInActionsSection extends StatelessWidget {
  const SignInActionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        const RememberMe(),
        TextButton(
          onPressed: () {},
          child: const Text(
            "Forgot Password?",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFFFF7A00),
            ),
          ),
        ),
      ],
    );
  }
}
