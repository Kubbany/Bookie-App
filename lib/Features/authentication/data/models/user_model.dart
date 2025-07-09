import 'package:booki/Features/authentication/domain/entites/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends UserEntity {
  const UserModel({required super.uId, required super.email});
  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      email: user.email ?? '',
      uId: user.uid,
    );
  }
}
