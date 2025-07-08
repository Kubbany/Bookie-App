import 'package:booki/Features/authentication/presentation/views/widgets/continue_with_item.dart';
import 'package:booki/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class ContinueWithList extends StatelessWidget {
  const ContinueWithList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        ContinueWithItem(
          image: Assets.imagesFacebookIcon,
        ),
        ContinueWithItem(
          image: Assets.imagesGoogleIcon,
        ),
      ],
    );
  }
}
