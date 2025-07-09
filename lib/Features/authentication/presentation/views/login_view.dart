import 'package:booki/Features/authentication/domain/repositories/auth_repo.dart';
import 'package:booki/Features/authentication/presentation/managers/login_cubit/login_cubit.dart';
import 'package:booki/Features/authentication/presentation/views/widgets/login_view_body_bloc_consumer.dart';

import 'package:booki/core/services/service_locator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt.get<AuthRepo>()),
      child: const Scaffold(
        body: LoginViewBodyBlocConsumer(),
      ),
    );
  }
}
