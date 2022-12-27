import 'package:rickmorty/src/features/location/data/models/location_model.dart';

import '../../domain/entities/location_entity.dart';

class LocationEntityAdapter {
  static LocationEntity adapterToModel(LocationModel model) {
    return LocationEntity(
      name: model.name,
      type: model.type,
      dimension: model.dimension,
      residents: model.residents,
      url: model.url,
    );
  }
}
