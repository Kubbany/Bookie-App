import 'package:booki/Features/home/presentation/views/widgets/custom_drawer_button.dart';
import 'package:booki/Features/home/presentation/views/widgets/log_out_button.dart';
import 'package:booki/Features/home/presentation/views/widgets/user_avatar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserDrawer extends StatelessWidget {
  const UserDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            const UserAvatar(),
            const SizedBox(height: 10),
            Text(
              FirebaseAuth.instance.currentUser!.email!,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Divider(color: Colors.grey, thickness: 3),
            const SizedBox(height: 20),
            CustomDrawerButton(
              title: 'Home',
              onPressed: () {
                //GoRouter.of(context).go(AppRouter.kProfilePostsView, extra: user);
              },
            ),
            CustomDrawerButton(
              title: 'Your Lists',
              onPressed: () {
                //GoRouter.of(context).go(AppRouter.kChatFakeDetectionView, extra: user);
              },
            ),
            const Spacer(),
            const LogoutButton(),
          ],
        ),
      ),
    );
  }
}
