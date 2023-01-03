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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Image.asset('assets/images/logo.png', width: MediaQuery.of(context).size.width * 0.5),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      Text('Character'.toUpperCase(), style: Theme.of(context).textTheme.titleSmall),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                            child: SizedBox(height: MediaQuery.of(context).size.height * 0.4, child: Image.asset('assets/images/character.gif', fit: BoxFit.cover)),
                            onTap: () => context.pushNamed('character')),
                      ),
                    ],
                  )),
                  Expanded(
                      child: Column(
                    children: [
                      Text('Location'.toUpperCase(), style: Theme.of(context).textTheme.titleSmall),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                            child: SizedBox(height: MediaQuery.of(context).size.height * 0.4, child: Image.asset('assets/images/location.gif', fit: BoxFit.cover)),
                            onTap: () => context.pushNamed('location')),
                      ),
                    ],
                  )),
                  Expanded(
                      child: Column(
                    children: [
                      Text('Episode'.toUpperCase(), style: Theme.of(context).textTheme.titleSmall),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                            child: SizedBox(height: MediaQuery.of(context).size.height * 0.4, child: Image.asset('assets/images/episode.gif', fit: BoxFit.cover)),
                            onTap: () => context.pushNamed('episode')),
                      ),
                    ],
                  )),
                ],
              ),
              const Spacer(),
              // Image.asset(
              //   'assets/images/portal_two.gif',
              //   width: MediaQuery.of(context).size.width * 0.5,
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text('Rick and Morty is created by Justin Roiland and Dan Harmon for Adult Swim', style: Theme.of(context).textTheme.titleSmall),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
