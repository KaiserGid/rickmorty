import 'package:rickmorty/src/features/character/domain/entities/character_entity.dart';

abstract class CharacterRepository {
  Future<List<CharacterEntity>> getAllCharacters();
}
