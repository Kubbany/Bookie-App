import 'package:booki/Features/authentication/domain/entites/user_entity.dart';
import 'package:booki/Features/authentication/domain/repositories/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepo authRepo;
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  RegisterCubit(this.authRepo) : super(RegisterInitial());

  Future<void> createUserWithEmailAndPassword() async {
    if (formKey.currentState!.validate()) {
      emit(RegisterLoading());
      formKey.currentState!.save();
      final result = await authRepo.createUserWithEmailAndPassword(email.text, password.text);

      result.fold(
        (failure) {
          emit(RegisterFailure(errorMessage: failure.errorMessage));
        },
        (userEntity) {
          emit(RegisterSuccess(userEntity: userEntity));
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
