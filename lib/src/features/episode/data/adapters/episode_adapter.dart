import '../../domain/entities/episode_entity.dart';
import '../models/episode_model.dart';

class EpisodenEntityAdapter {
  static EpisodeEntity adapterToModel(EpisodeModel model) {
    return EpisodeEntity(name: model.name, airDate: model.airDate, episode: model.episode, characters: model.characters);
  }
}
