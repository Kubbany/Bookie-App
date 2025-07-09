import 'package:booki/Features/authentication/presentation/managers/register_cubit/register_cubit.dart';
import 'package:booki/Features/authentication/presentation/views/widgets/register_view_body.dart';
import 'package:booki/core/utils/app_router.dart';
import 'package:booki/core/utils/methods/show_snack_bar_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterViewBodyBlocConsumer extends StatelessWidget {
  const RegisterViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          GoRouter.of(context).go(AppRouter.kHomeView);
          showSnackBarMessage(context, "Signed Up Successfuly!");
        } else if (state is RegisterFailure) {
          showSnackBarMessage(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is RegisterLoading,
          progressIndicator: const CircularProgressIndicator(
            color: Color(0xFFFF7A00),
          ),
          child: const RegisterViewBody(),
        );
      },
    );
  }
}
