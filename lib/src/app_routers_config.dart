import 'package:go_router/go_router.dart';
import 'package:rickmorty/src/features/character/presenter/pages/character_page_detail.dart';
import 'package:rickmorty/src/features/episode/presenter/pages/episode_home_page.dart';
import 'package:rickmorty/src/features/home/presenter/page/home_page.dart';
import 'package:rickmorty/src/features/location/presenter/pages/location_home_page.dart';
import 'package:rickmorty/src/features/location/presenter/store/location_store.dart';

import 'app_module.dart';
import 'core/features/characteres/models/character_entity.dart';
import 'features/character/presenter/pages/character_home_page.dart';
import 'features/character/presenter/store/character_store.dart';
import 'features/episode/presenter/store/episode_store.dart';
import 'features/splash/controllers/splash_controller_i.dart';
import 'features/splash/presenter/pages/splash/splash_page.dart';

final routes = GoRouter(routes: [
  GoRoute(name: 'splash', path: '/', builder: (context, state) => SplashPage(splashController: getIt.get<SplashController>())),
  GoRoute(name: 'home', path: '/home', builder: (context, state) => const HomePage()),
  GoRoute(name: 'episode', path: '/episode', builder: (context, state) => EpisodeHomePage(episodeController: getIt.get<EpisodeStore>())),
  GoRoute(
      name: 'character',
      path: '/character',
      builder: (context, state) {
        return CharacterPage(characterController: getIt.get<CharacterStore>());
      },
      routes: [
        GoRoute(
          name: 'detail',
          path: 'detail/:character',
          builder: (context, state) => CharacterPageDetail(character: state.params['character'] as Character),
        )
      ]),
  GoRoute(name: 'location', path: '/location', builder: (context, state) => LocationHomePage(locationController: getIt.get<LocationStore>())),
]);
