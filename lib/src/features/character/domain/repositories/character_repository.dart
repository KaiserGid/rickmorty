import 'package:rickmorty/src/core/features/characteres/models/character_entity.dart';

abstract class CharacterRepository {
  Future<List<Character>> getAllCharacters();
}
