import 'package:dio/dio.dart';

import '../../../app_module.dart';
import '../data/datasourse/location_datasource.dart';
import '../data/repositories/episode_repository.dart';
import '../domain/repositories/episode_repository.dart';
import '../domain/usecase/episode_usecases/get_all_episode_usecase.dart';
import '../external/dio_episode_datasource.dart';
import 'store/episode_store.dart';

episodeSetup() {
  getIt.registerFactory<EpisodeDatasource>(() => DioEpisodeDatasource(dio: getIt.get<Dio>()));
  getIt.registerFactory<EpisodeRepository>(() => EpisodeRepositoryImpl(episodeDataSource: getIt.get<EpisodeDatasource>()));
  getIt.registerFactory<GetAllEpisodeUsecase>(() => GetAllEpisodeUsecaseImpl(episodeRepository: getIt.get<EpisodeRepository>()));
  getIt.registerLazySingleton<EpisodeStore>(() => EpisodeStore(getAllEpisodeUsecase: getIt.get<GetAllEpisodeUsecase>()));
}
