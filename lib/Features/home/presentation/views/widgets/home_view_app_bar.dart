import 'package:booki/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:booki/Features/home/presentation/views/widgets/search_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeViewAppBar extends StatelessWidget {
  const HomeViewAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      leading: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.menu_rounded,
          color: Colors.grey[700],
          size: 30,
        ),
      ),
      trailingIcon: FontAwesomeIcons.magnifyingGlass,
      trailingOnPressed: () {
        showSearch(
          context: context,
          delegate: SearchView(),
        );
      },
    );
  }
}
