import 'package:booki/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          "Already Have an Account?",
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        TextButton(
          onPressed: () {
            GoRouter.of(context).pushReplacement(
              AppRouter.kLoginView,
            );
          },
          child: const Text(
            "Sign In",
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
