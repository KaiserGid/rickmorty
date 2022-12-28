import 'package:rickmorty/src/features/location/domain/entities/location_entity.dart';

abstract class LocationRepository {
  Future<List<LocationEntity>> getAllLocation();
}
