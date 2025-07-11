import 'package:booki/Features/home/domain/entites/book_entity.dart';
import 'package:booki/Features/home/presentation/views/widgets/book_actions.dart';
import 'package:booki/Features/home/presentation/views/widgets/book_card_image.dart';
import 'package:booki/Features/home/presentation/views/widgets/book_details.dart';
import 'package:booki/Features/home/presentation/views/widgets/rating_actions.dart';
import 'package:booki/Features/home/presentation/views/widgets/rating_and_page_info.dart';
import 'package:booki/core/utils/app_validators.dart';
import 'package:booki/core/utils/widgets/custom_button.dart';
import 'package:booki/core/utils/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              spacing: 15,
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: Colors.grey[700],
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.3,
                  child: BookCardImage(image: book.image ?? ''),
                ),
                BookDetails(
                  title: book.title,
                  author: book.authorName ?? "Unknown Author",
                ),
                RatingAndPageInfo(
                  rating: 0,
                  pageCount: book.pageCount!,
                ),
                RatingActions(
                  onRatingSelected: (int index) {},
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: BooksActions(
                    url: book.url,
                    pdf: book.pdf,
                  ),
                ),
                CustomTextFormField(
                  hintText: "Leave Your Review",
                  verticalContentPadding: 90,
                  fillColor: Colors.white,
                  borderColor: Colors.grey,
                  borderRadius: 10,
                  textEditingController: TextEditingController(),
                  validator: AppValidators.requiredField,
                ),
                CustomButton(
                  title: "Submit",
                  titleSize: 18,
                  onPressed: () {},
                  borderRadius: 8,
                  backgroundColor: const Color(0xFFFF7A00),
                  buttonHeight: 50,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
