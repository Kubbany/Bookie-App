import 'package:booki/Features/home/presentation/views/widgets/home_view_body.dart';
import 'package:booki/Features/home/presentation/views/widgets/user_drawer.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: UserDrawer(),
      body: SafeArea(child: HomeViewBody()),
    );
  }
}
