import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            radius: 0.4,
            colors: [
              Colors.green,
              Color(0xff050404),
            ],
          ),
        ),
        child: Stack(
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
                  'Carregando...'.toUpperCase(),
                  style: const TextStyle(
                      color: Colors.lightGreenAccent, fontSize: 20),
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
                  style:
                      TextStyle(color: Colors.lightGreenAccent, fontSize: 12),
                )),
            Positioned(
                bottom: MediaQuery.of(context).size.height * 0.30,
                left: MediaQuery.of(context).size.width * 0.35,
                child: const Text(
                  'Powered by GidKaiser',
                  style:
                      TextStyle(color: Colors.lightGreenAccent, fontSize: 12),
                )),
          ],
        ),
      ),
    );
  }
}
