import 'package:flutter/material.dart';

class LogoProgressIndicator extends StatelessWidget {
  const LogoProgressIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Image.asset(
      'assets/images/portal_two.gif',
      height: 250,
    ));
  }
}
