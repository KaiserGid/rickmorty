import 'package:flutter/material.dart';

import 'app_routers_config.dart';

class AppCore extends StatelessWidget {
  const AppCore({super.key});

  @override
  Widget build(BuildContext context) {
    final routerConfig = routes;

    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: routerConfig,
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData(
          textTheme: const TextTheme(
            titleMedium: TextStyle(color: Colors.lightGreenAccent, fontFamily: 'nanum_gothic_coding', fontSize: 20),
            titleSmall: TextStyle(color: Colors.lightGreenAccent, fontFamily: 'nanum_gothic_coding', fontSize: 16),
            titleLarge: TextStyle(color: Colors.lightGreen, fontFamily: 'nanum_gothic_coding', fontSize: 24),
          ),
        ));
  }
}
