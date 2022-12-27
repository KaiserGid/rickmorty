import 'package:rickmorty/src/features/character/data/models/character_model.dart';
import 'package:rickmorty/src/features/character/domain/entities/character_entity.dart';

class CharacterEntityAdapter {
  static CharacterEntity adapterToModel(CharacterModel model) {
    return CharacterEntity(
      name: model.name,
      status: model.status,
      species: model.species,
      gender: model.gender,
      origin: model.origin,
      location: model.location,
      image: model.image,
    );
  }
}
