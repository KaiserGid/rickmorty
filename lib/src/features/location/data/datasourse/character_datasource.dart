import '../models/character_model.dart';

abstract class CharacterDatasource {
  Future<List<CharacterModel>> fetchCharacter({required String url});
}
