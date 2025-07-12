import 'package:booki/Features/home/data/repositories/home_repo_impl.dart';
import 'package:booki/Features/home/domain/use_cases/fetch_books_use_case.dart';
import 'package:booki/Features/home/domain/use_cases/submit_ratings_use_case.dart';
import 'package:booki/Features/home/presentation/manager/books_cubit/books_cubit.dart';
import 'package:booki/core/services/service_locator.dart';
import 'package:booki/core/utils/app_router.dart';
import 'package:booki/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupServiceLocator();
  runApp(const BookieApp());
}

class BookieApp extends StatelessWidget {
  const BookieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BooksCubit(
        FetchBooksUseCase(getIt.get<HomeRepoImpl>()),
        submitRatingUseCase: SubmitRatingUseCase(getIt.get<HomeRepoImpl>()),
      ),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color(0xfff1eee3),
          appBarTheme: const AppBarTheme(
            color: Colors.black,
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
          ),
        ),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
