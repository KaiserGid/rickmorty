import '../models/location_model.dart';

abstract class LocationDatasource {
  Future<List<LocationModel>> fetchLocations();
}
