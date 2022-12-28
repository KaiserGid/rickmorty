import 'package:rickmorty/src/features/location/domain/entities/location_entity.dart';

import '../../repositories/location_repository.dart';

abstract class GetAllLocationUsecase {
  Future<List<LocationEntity>> call();
}

class GetAllLocationUsecaseImpl implements GetAllLocationUsecase {
  final LocationRepository locationRepository;

  GetAllLocationUsecaseImpl({
    required this.locationRepository,
  });

  @override
  Future<List<LocationEntity>> call() async {
    return await locationRepository.getAllLocation();
  }
}
