import 'package:flutter/material.dart';

import 'app_routers_config.dart';

class AppCore extends StatelessWidget {
  const AppCore({super.key});

  @override
  Widget build(BuildContext context) {
    final routerConfig = routes;

    return MaterialApp.router(
      routerConfig: routerConfig,
    );
  }
}
