import '../../domain/entities/character_entity.dart';
import '../models/character_model.dart';

class CharacterModelToEntityAdapter {
  static CharacterEntity adapterToModel(CharacterModel model) {
    return CharacterEntity(
      name: model.name,
      urlImage: model.image,
    );
  }
}
