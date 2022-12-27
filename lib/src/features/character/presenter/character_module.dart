import 'package:dio/dio.dart';
import 'package:rickmorty/src/features/character/data/datasources/character_datasource.dart';
import 'package:rickmorty/src/features/character/data/repositories/character/character_repository.dart';
import 'package:rickmorty/src/features/character/domain/repositories/character_repository.dart';
import 'package:rickmorty/src/features/character/domain/usecase/chars_usecase/get_all_chars_usecase.dart';
import 'package:rickmorty/src/features/character/external/remote/dio_character_datasourcce.dart';
import 'package:rickmorty/src/features/character/presenter/store/character_store.dart';

import '../../../app_module.dart';

characterSetup() {
  getIt.registerFactory<CharacterDatasource>(() => DioharacterDatasource(dio: getIt.get<Dio>()));
  getIt.registerFactory<CharacterRepository>(() => CharacterRepositoryImpl(characterDatSource: getIt.get<CharacterDatasource>()));
  getIt.registerFactory<GetAllCharsUsecase>(() => GetAllCharsUsecaseImpl(characterRepository: getIt.get<CharacterRepository>()));
  getIt.registerLazySingleton<CharacterStore>(() => CharacterStore(getAllCharsUsecase: getIt.get<GetAllCharsUsecase>()));
  // getIt.registerFactory<CharacterEntity>(() => getIt<CharacterEntity>());
}
