import '../../domain/entities/location_entity.dart';
import '../../domain/repositories/location_repository.dart';
import '../adapters/location_adapter.dart';
import '../datasourse/location_datasource.dart';
import '../models/location_model.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationDatasource locationDataSource;

  LocationRepositoryImpl({
    required this.locationDataSource,
  });

  @override
  Future<List<LocationEntity>> getAllLocation() async {
    List<LocationEntity> locationEntities = [];

    List<LocationModel> locationModels = await locationDataSource.fetchLocations();

    locationEntities = locationModels.map((e) => LocationEntityAdapter.adapterToModel(e)).toList();

    return locationEntities;
  }
}
