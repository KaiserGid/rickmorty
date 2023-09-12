import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rickmorty/src/core/shared/constants/colors.dart';

import '../../../controllers/splash_controller_i.dart';

class SplashPage extends StatefulWidget {
  final SplashController splashController;
  const SplashPage({
    Key? key,
    required this.splashController,
  }) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    widget.splashController.init().then((value) => context.goNamed('home')).then((_) => setState(() {})); //teste de atualização de controller
  }

  @override
  Widget build(BuildContext context) {
    final splashController = widget.splashController;

    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                radius: 0.4,
                colors: [Colors.green, backGroundColor],
              ),
            ),
            child: LoadLogoWidget(
              statusString: splashController.stateString,
            )));
  }
}

class LoadLogoWidget extends StatelessWidget {
  final String statusString;

  const LoadLogoWidget({
    Key? key,
    required this.statusString,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Positioned(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            'assets/images/portal.gif',
            // alignment: Alignment.center,
          ),
        ),
        Positioned(
            top: MediaQuery.of(context).size.height * 0.35,
            left: MediaQuery.of(context).size.width * 0.30,
            child: Text(
              statusString.toUpperCase(),
              style: const TextStyle(color: Colors.lightGreenAccent, fontSize: 20),
            )),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.58,
          left: MediaQuery.of(context).size.width * 0.2,
          child: Image.asset(
            'assets/images/logo.png',
            height: MediaQuery.of(context).size.height * 0.1,
          ),
        ),
        Positioned(
            bottom: MediaQuery.of(context).size.height * 0.30,
            left: MediaQuery.of(context).size.width * 0.35,
            child: const Text(
              'Powered by GidKaiser',
              style: TextStyle(color: Colors.lightGreenAccent, fontSize: 12),
            )),
        Positioned(
            bottom: MediaQuery.of(context).size.height * 0.30,
            left: MediaQuery.of(context).size.width * 0.35,
            child: const Text(
              'teste',
              style: TextStyle(color: Colors.lightGreenAccent, fontSize: 12),
            )),
      ],
    );
  }
}
