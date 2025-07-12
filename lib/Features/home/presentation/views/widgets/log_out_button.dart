import 'package:booki/core/utils/app_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton.icon(
        onPressed: () {
          GoRouter.of(context).go(AppRouter.kLoginView);
          FirebaseAuth.instance.signOut();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFF7A00), // Blue logout button
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          minimumSize: const Size(double.infinity, 50),
        ),
        icon: const Icon(
          Icons.logout,
          color: Colors.white,
          size: 25,
        ),
        label: const Text(
          'Logout',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
