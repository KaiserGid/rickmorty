import 'package:rickmorty/src/features/location/domain/entities/character_entity.dart';

abstract class CharacterRepository {
  Future<List<CharacterEntity>> getAllCharacterByLocation(String url);
}
