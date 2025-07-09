import 'package:booki/Features/authentication/domain/entites/user_entity.dart';
import 'package:booki/Features/authentication/domain/repositories/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo authRepo;
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  LoginCubit(this.authRepo) : super(LoginInitial());

  Future<void> signInWithEmailAndPassword() async {
    if (formKey.currentState!.validate()) {
      emit(LoginLoading());
      formKey.currentState!.save();
      final result = await authRepo.signInWithEmailAndPassword(email.text, password.text);

      result.fold(
        (failure) {
          emit(LoginFailure(errorMessage: failure.errorMessage));
        },
        (userEntity) {
          emit(LoginSuccess(userEntity: userEntity));
        },
      );
    } else {
      autovalidateMode = AutovalidateMode.always;
    }
  }

  @override
  Future<void> close() {
    email.dispose();
    password.dispose();
    return super.close();
  }
}
