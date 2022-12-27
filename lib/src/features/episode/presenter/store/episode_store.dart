import 'package:flutter/material.dart';

import '../../domain/entities/episode_entity.dart';
import '../../domain/usecase/episode_usecases/get_all_episode_usecase.dart';

class EpisodeStore extends ChangeNotifier {
  GetAllEpisodeUsecase getAllEpisodeUsecase;

  EpisodeStore({
    required this.getAllEpisodeUsecase,
  });

  List<EpisodeEntity> episodes = [];

  Future getEpisodes() async {
    episodes.addAll(await getAllEpisodeUsecase());

    notifyListeners();
  }
}
