import '../../entities/episode_entity.dart';
import '../../repositories/episode_repository.dart';

abstract class GetAllEpisodeUsecase {
  Future<List<EpisodeEntity>> call();
}

class GetAllEpisodeUsecaseImpl implements GetAllEpisodeUsecase {
  final EpisodeRepository episodeRepository;

  GetAllEpisodeUsecaseImpl({
    required this.episodeRepository,
  });

  @override
  Future<List<EpisodeEntity>> call() async {
    return await episodeRepository.getAllLocation();
  }
}
