import 'package:booki/core/errors/exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassword({required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomException(errorMessage: 'The Password Provided Is Too Weak.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(errorMessage: 'The Account Already Exists For That Email.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(errorMessage: 'No Network Connection.');
      } else {
        throw CustomException(errorMessage: 'An Error Occured, Please Try Again');
      }
    } catch (e) {
      throw CustomException(errorMessage: 'An Error Occured, Please Try Again');
    }
  }
}
