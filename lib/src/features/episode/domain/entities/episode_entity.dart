import 'package:flutter/foundation.dart';
import 'package:rickmorty/src/core/entity.dart';

class EpisodeEntity extends Entity {
  String name;
  String airDate;
  String episode;
  List<String> characters;

  EpisodeEntity({
    required this.name,
    required this.airDate,
    required this.episode,
    required this.characters,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EpisodeEntity && other.name == name && other.airDate == airDate && other.episode == episode && listEquals(other.characters, characters);
  }

  @override
  int get hashCode {
    return name.hashCode ^ airDate.hashCode ^ episode.hashCode ^ characters.hashCode;
  }
}
