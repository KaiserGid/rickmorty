import '../../domain/entities/episode_entity.dart';
import '../../domain/repositories/episode_repository.dart';
import '../adapters/episode_adapter.dart';
import '../datasourse/location_datasource.dart';
import '../models/episode_model.dart';

class EpisodeRepositoryImpl implements EpisodeRepository {
  final EpisodeDatasource episodeDataSource;

  EpisodeRepositoryImpl({
    required this.episodeDataSource,
  });

  @override
  Future<List<EpisodeEntity>> getAllLocation() async {
    List<EpisodeEntity> episodeEntities = [];

    List<EpisodeModel> episodeModels = await episodeDataSource.fetchEpisodes();

    episodeEntities = episodeModels.map((e) => EpisodenEntityAdapter.adapterToModel(e)).toList();

    return episodeEntities;
  }
}
