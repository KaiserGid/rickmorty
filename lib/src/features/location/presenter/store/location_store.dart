import 'package:flutter/material.dart';
import 'package:rickmorty/src/features/location/domain/usecase/location_usecases/get_all_location_usecase.dart';

import '../../domain/entities/location_entity.dart';

class LocationStore extends ChangeNotifier {
  GetAllLocationUsecase getAllLocationUsecase;

  LocationStore({
    required this.getAllLocationUsecase,
  });

  List<LocationEntity> locations = [];

  Future getLocations() async {
    locations.addAll(await getAllLocationUsecase());

    notifyListeners();
  }
}
