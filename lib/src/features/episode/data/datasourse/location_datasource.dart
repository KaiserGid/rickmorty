import '../models/episode_model.dart';

abstract class EpisodeDatasource {
  Future<List<EpisodeModel>> fetchEpisodes();
}
