import 'package:rickmorty/src/core/features/characteres/data/datasources/character_datasource.dart';
import 'package:rickmorty/src/core/features/characteres/domain/repositories/character_repository.dart';
import 'package:rickmorty/src/core/features/characteres/models/character_entity.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterDatasource characterDatSource;

  CharacterRepositoryImpl({
    required this.characterDatSource,
  });

  @override
  Future<List<Character>> getAllCharacters() async {
    List<Character> charModels = await characterDatSource.fetchCharacters();

    return charModels;
  }
}
