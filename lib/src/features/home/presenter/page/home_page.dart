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
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(onPressed: () => context.pushNamed('location'), child: const Text('Locations')),
            ElevatedButton(onPressed: () => context.pushNamed('character'), child: const Text('Characters')),
            ElevatedButton(onPressed: () => context.pushNamed('episode'), child: const Text('Episodes')),
          ],
        ),
      ),
    );
  }
}
