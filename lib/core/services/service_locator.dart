import 'package:booki/Features/authentication/data/repositories/auth_repo_impl.dart';
import 'package:booki/Features/authentication/domain/repositories/auth_repo.dart';
import 'package:booki/core/services/firebase_auth_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<FirebaseAuthService>(
    FirebaseAuthService(),
  );

  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      firebaseAuthService: getIt.get<FirebaseAuthService>(),
    ),
  );
}
