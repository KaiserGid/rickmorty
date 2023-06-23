import '../../../../core/features/characteres/models/character_entity.dart';

abstract class CharacterDatasource {
  Future<List<Character>> fetchCharacters();
}
