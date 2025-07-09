import 'package:booki/Features/authentication/presentation/managers/login_cubit/login_cubit.dart';
import 'package:booki/Features/authentication/presentation/views/widgets/login_view_body.dart';
import 'package:booki/core/utils/app_router.dart';
import 'package:booki/core/utils/methods/show_snack_bar_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginViewBodyBlocConsumer extends StatelessWidget {
  const LoginViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          GoRouter.of(context).go(AppRouter.kHomeView);
          showSnackBarMessage(context, "Logged In Successfuly!");
        } else if (state is LoginFailure) {
          showSnackBarMessage(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is LoginLoading,
          progressIndicator: const CircularProgressIndicator(
            color: Color(0xFFFF7A00),
          ),
          child: const LoginViewBody(),
        );
      },
    );
  }
}
