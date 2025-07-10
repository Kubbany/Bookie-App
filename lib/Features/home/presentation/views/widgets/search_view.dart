import 'package:booki/Features/home/data/repositories/home_repo_impl.dart';
import 'package:booki/Features/home/domain/entites/book_entity.dart';
import 'package:booki/Features/home/domain/use_cases/fetch_books_use_case.dart';
import 'package:booki/Features/home/presentation/manager/books_cubit/books_cubit.dart';
import 'package:booki/Features/home/presentation/views/widgets/books_grid_view.dart';
import 'package:booki/core/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchView extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {},
        icon: const Icon(
          FontAwesomeIcons.magnifyingGlass,
          size: 20,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => Navigator.of(context).pop(),
      // Exit from the search screen.
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<BookEntity> results = [];

    return BlocProvider(
      create: (context) => BooksCubit(FetchBooksUseCase(getIt.get<HomeRepoImpl>()))..fetchBooks(),
      child: Builder(builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Results",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              BlocBuilder<BooksCubit, BooksState>(
                builder: (context, state) {
                  if (state is BooksSuccess) {
                    for (var book in state.books) {
                      if (book.title.toLowerCase().contains(query.toLowerCase())) {
                        results.add(book);
                      }
                    }
                    return Expanded(
                      child: BooksGridView(
                        books: results,
                        scrollController: ScrollController(),
                      ),
                    );
                  } else if (state is BooksFailure) {
                    return Center(
                      child: Text(state.errorMessage),
                    );
                  } else {
                    return const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Color(0xFFFF7A00),
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        );
      }),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildResults(context);
  }
}
