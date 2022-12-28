import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rickmorty/src/features/shared/constants/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset(
              'assets/images/logo.png',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            ElevatedButton(
              onPressed: () => context.pushNamed('location'),
              style: ElevatedButton.styleFrom(backgroundColor: primary),
              child: const Text('Locations'),
            ),
            ElevatedButton(onPressed: () => context.pushNamed('character'), style: ElevatedButton.styleFrom(backgroundColor: primary), child: const Text('Characters')),
            ElevatedButton(onPressed: () => context.pushNamed('episode'), style: ElevatedButton.styleFrom(backgroundColor: primary), child: const Text('Episodes')),
            const Spacer(),
            Image.asset(
              'assets/images/portal_two.gif',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
