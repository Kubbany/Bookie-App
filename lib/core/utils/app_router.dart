import 'package:booki/Features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),

      // GoRoute(
      //   path: kLoginView,
      //   pageBuilder: (context, state) => slidingNavigation(
      //     state,
      //     const LoginView(),
      //   ),
      // ),
      // GoRoute(
      //   path: kRegisterView,
      //   pageBuilder: (context, state) => slidingNavigation(
      //     state,
      //     const RegisterView(),
      //   ),
      // ),
      // GoRoute(
      //   path: kHomeView,
      //   pageBuilder: (context, state) => slidingNavigation(
      //     state,
      //     const HomeView(),
      //   ),
      // ),
    ],
  );

  static CustomTransitionPage<dynamic> slidingNavigation(GoRouterState state, Widget view) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: view,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0); // Start from bottom
        const end = Offset.zero; // End at normal position
        const curve = Curves.easeInOut;

        final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
