import 'package:booki/Features/authentication/domain/entites/user_entity.dart';
import 'package:booki/Features/authentication/domain/repositories/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepo authRepo;
  RegisterCubit(this.authRepo) : super(RegisterInitial());

  Future<void> createUserWithEmailAndPassword(String email, String password) async {
    emit(RegisterLoading());
    final result = await authRepo.createUserWithEmailAndPassword(email, password);

    result.fold(
      (failure) {
        emit(RegisterFailure(errorMessage: failure.errorMessage));
      },
      (userEntity) {
        emit(RegisterSuccess(userEntity: userEntity));
      },
    );
  }
}
