import 'package:go_router/go_router.dart';
import 'package:rickmorty/src/features/splash/presenter/pages/splash_page.dart';

final routes = GoRouter(
  routes: [
    GoRoute(
      name: 'splash',
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
  ],
);
