import 'package:rickmorty/src/core/entity.dart';

class CharacterEntity extends Entity {
  String name;
  String urlImage;

  CharacterEntity({
    required this.name,
    required this.urlImage,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CharacterEntity && other.name == name && other.urlImage == urlImage;
  }

  @override
  int get hashCode => name.hashCode ^ urlImage.hashCode;
}
