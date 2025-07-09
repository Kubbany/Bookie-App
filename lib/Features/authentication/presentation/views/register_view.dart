import 'package:booki/Features/authentication/domain/repositories/auth_repo.dart';
import 'package:booki/Features/authentication/presentation/managers/register_cubit/register_cubit.dart';
import 'package:booki/Features/authentication/presentation/views/widgets/register_view_body_bloc_consumer.dart';
import 'package:booki/core/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(getIt.get<AuthRepo>()),
      child: const Scaffold(
        body: RegisterViewBodyBlocConsumer(),
      ),
    );
  }
}
