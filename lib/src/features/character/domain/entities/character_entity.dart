import 'package:rickmorty/src/core/entity.dart';

class CharacterEntity extends Entity {
  final String name;
  final String status;
  final String species;
  final String gender;
  final String origin;
  final String location;
  final String image;

  CharacterEntity({
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CharacterEntity &&
        other.name == name &&
        other.status == status &&
        other.species == species &&
        other.gender == gender &&
        other.origin == origin &&
        other.location == location &&
        other.image == image;
  }

  @override
  int get hashCode {
    return name.hashCode ^ status.hashCode ^ species.hashCode ^ gender.hashCode ^ origin.hashCode ^ location.hashCode ^ image.hashCode;
  }
}
