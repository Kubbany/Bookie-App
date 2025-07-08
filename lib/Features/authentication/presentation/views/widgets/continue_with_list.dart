import 'package:booki/Features/authentication/presentation/views/widgets/continue_with_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContinueWithList extends StatelessWidget {
  const ContinueWithList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        ContinueWithItem(
          icon: FontAwesomeIcons.github,
        ),
        ContinueWithItem(
          icon: FontAwesomeIcons.facebookF,
        ),
        ContinueWithItem(
          icon: FontAwesomeIcons.linkedinIn,
        ),
      ],
    );
  }
}
