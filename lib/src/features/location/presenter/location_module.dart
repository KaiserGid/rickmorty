import 'package:dio/dio.dart';
import 'package:rickmorty/src/features/location/data/datasourse/location_datasource.dart';
import 'package:rickmorty/src/features/location/data/repositories/location_repository.dart';
import 'package:rickmorty/src/features/location/domain/repositories/location_repository.dart';
import 'package:rickmorty/src/features/location/domain/usecase/location_usecases/get_all_location_usecase.dart';
import 'package:rickmorty/src/features/location/external/dio_location_datasource.dart';
import 'package:rickmorty/src/features/location/presenter/store/location_store.dart';

import '../../../app_module.dart';

locationSetup() {
  getIt.registerFactory<LocationDatasource>(() => DioLocationDatasource(dio: getIt.get<Dio>()));
  getIt.registerFactory<LocationRepository>(() => LocationRepositoryImpl(locationDataSource: getIt.get<LocationDatasource>()));
  getIt.registerFactory<GetAllLocationUsecase>(() => GetAllLocationUsecaseImpl(locationRepository: getIt.get<LocationRepository>()));
  getIt.registerLazySingleton<LocationStore>(() => LocationStore(getAllLocationUsecase: getIt.get<GetAllLocationUsecase>()));
}
