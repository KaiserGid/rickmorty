import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rickmorty/src/features/character/presenter/character_module.dart';
import 'package:rickmorty/src/features/location/presenter/location_module.dart';
import 'package:rickmorty/src/features/splash/presenter/modules/splash_module.dart';

import 'features/episode/presenter/episode_module.dart';

final getIt = GetIt.instance;

appSetup() {
  getIt.registerFactory(() => Dio());
  splashSetup();
  locationSetup();
  characterSetup();
  episodeSetup();
}
