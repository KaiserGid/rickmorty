import 'package:flutter/material.dart';
import 'package:rickmorty/src/core/shared/constants/colors.dart';

class AppbarCustomWidget extends StatelessWidget implements PreferredSizeWidget {
  final String appTitle;

  const AppbarCustomWidget({
    Key? key,
    required this.appTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: backGroundColor,
      title: Text(
        appTitle,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0, top: 8.0, bottom: 8.0),
          child: Image.asset(
            'assets/images/logo.png',
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
