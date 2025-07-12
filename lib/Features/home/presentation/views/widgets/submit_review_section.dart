import 'dart:developer';

import 'package:booki/Features/home/presentation/manager/reviews_cubit/reviews_cubit.dart';
import 'package:booki/core/utils/app_validators.dart';
import 'package:booki/core/utils/methods/show_snack_bar_message.dart';
import 'package:booki/core/utils/widgets/custom_button.dart';
import 'package:booki/core/utils/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubmitReviewSection extends StatelessWidget {
  const SubmitReviewSection({super.key, required this.bookId});
  final String bookId;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<ReviewsCubit>().formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 15,
        children: <Widget>[
          CustomTextFormField(
            hintText: "Leave Your Review",
            verticalContentPadding: 90,
            fillColor: Colors.white,
            borderColor: Colors.grey,
            borderRadius: 10,
            textEditingController: context.read<ReviewsCubit>().review,
            validator: AppValidators.requiredField,
          ),
          BlocConsumer<ReviewsCubit, ReviewsState>(
            listener: (context, state) {
              if (state is ReviewCreatedSuccess) {
                context.read<ReviewsCubit>().review.clear();
                showSnackBarMessage(context, "Review Added Successfuly!");
                context.read<ReviewsCubit>().formKey.currentState!.reset();
              } else if (state is ReviewCreatedFailure) {
                showSnackBarMessage(context, state.errorMessage);
              }
            },
            builder: (context, state) {
              return CustomButton(
                isLoading: State is ReviewsLoading,
                title: "Submit",
                titleSize: 18,
                onPressed: () {
                  log(context.read<ReviewsCubit>().review.text);
                  context.read<ReviewsCubit>().submitReview(bookId);
                },
                borderRadius: 8,
                backgroundColor: const Color(0xFFFF7A00),
                buttonHeight: 50,
              );
            },
          ),
          const Text(
            'Reviews',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
