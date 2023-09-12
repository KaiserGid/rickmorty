import 'package:flutter/material.dart';
import 'package:rickmorty/src/features/episode/presenter/states/episode_states.dart';

import '../../domain/entities/episode_entity.dart';
import '../../domain/usecase/episode_usecases/get_all_episode_usecase.dart';

class EpisodeStore extends ChangeNotifier {
  GetAllEpisodeUsecase getAllEpisodeUsecase;

  EpisodeStore({
    required this.getAllEpisodeUsecase,
  });

  List<EpisodeEntity> episodes = [];
  EpsodeState state = LoadingEpsodeState();

  Future getEpisodes() async {
    state = LoadingEpsodeState();
    notifyListeners();
    episodes.addAll(await getAllEpisodeUsecase());
    state = IdleEpisodeState(epsode: episodes);

    notifyListeners();
  }
}
