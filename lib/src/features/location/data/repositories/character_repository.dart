import 'package:rickmorty/src/features/location/data/adapters/charactermodel_adapter_to_entity.dart';
import 'package:rickmorty/src/features/location/data/datasourse/character_datasource.dart';
import 'package:rickmorty/src/features/location/data/models/character_model.dart';
import 'package:rickmorty/src/features/location/domain/entities/character_entity.dart';

import '../../domain/repositories/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterDatasource characterDataSource;

  CharacterRepositoryImpl({
    required this.characterDataSource,
  });

  @override
  Future<List<CharacterEntity>> getAllCharacterByLocation(String url) async {
    List<CharacterModel> characterModels = await characterDataSource.fetchCharacter(url: url);

    return characterModels.map((e) => CharacterModelToEntityAdapter.adapterToModel(e)).toList();
  }
}
