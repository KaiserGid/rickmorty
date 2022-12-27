import 'package:rickmorty/src/features/character/data/adapters/entity_adapter.dart';
import 'package:rickmorty/src/features/character/data/datasources/character_datasource.dart';
import 'package:rickmorty/src/features/character/data/models/character_model.dart';
import 'package:rickmorty/src/features/character/domain/entities/character_entity.dart';
import 'package:rickmorty/src/features/character/domain/repositories/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterDatasource characterDatSource;

  CharacterRepositoryImpl({
    required this.characterDatSource,
  });

  @override
  Future<List<CharacterEntity>> getAllCharacters() async {
    List<CharacterEntity> charEntities = [];

    List<CharacterModel> charModels = await characterDatSource.fetchCharacters();

    charEntities = charModels.map((e) => CharacterEntityAdapter.adapterToModel(e)).toList();

    return charEntities;
  }
}
