import 'package:flutter/material.dart';
import 'package:rickmorty/src/core/shared/constants/colors.dart';
import 'package:rickmorty/src/core/shared/widgets/appbar_widget.dart';
import 'package:rickmorty/src/core/shared/widgets/logo_progress_indicator_widget.dart';

import '../../../../app_module.dart';
import '../../domain/entities/episode_entity.dart';
import '../controller/episode_lcontroller.dart';
import '../store/episode_store.dart';

class EpisodeHomePage extends StatefulWidget {
  final EpisodeStore episodeController;

  const EpisodeHomePage({
    Key? key,
    required this.episodeController,
  }) : super(key: key);

  @override
  State<EpisodeHomePage> createState() => _EpisodeHomePageState();
}

class _EpisodeHomePageState extends State<EpisodeHomePage> {
  EpisodeStore get controller => widget.episodeController;
  final EpisodeController _episodeController = EpisodeController();
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    getIt<EpisodeStore>().addListener(() {});
    _episodeController.init();
    _scrollController = ScrollController();
    _scrollController.addListener(infinitScroll);
  }

  infinitScroll() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      controller.getEpisodes();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarCustomWidget(appTitle: 'Episodes'),
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: backGroundColor,
      body: AnimatedBuilder(
        animation: controller,
        builder: (context, child) => Visibility(
          visible: controller.episodes.isEmpty,
          replacement: ListView.separated(
            controller: _scrollController,
            separatorBuilder: (context, index) => const Divider(height: 1),
            itemCount: controller.episodes.length,
            itemBuilder: (context, index) {
              EpisodeEntity episode = controller.episodes[index];
              return EpisodeListItemWidget(episode: episode);
            },
          ),
          child: const LogoProgressIndicator(),
        ),
      ),
    );
  }
}

class EpisodeListItemWidget extends StatelessWidget {
  const EpisodeListItemWidget({
    Key? key,
    required this.episode,
  }) : super(key: key);

  final EpisodeEntity episode;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 08),
      color: backGroundColor,
      height: 64,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(episode.episode.toString(), style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(width: 50),
          Expanded(child: Text(episode.name, style: Theme.of(context).textTheme.titleMedium, overflow: TextOverflow.clip)),
        ],
      ),
    );
  }
}
