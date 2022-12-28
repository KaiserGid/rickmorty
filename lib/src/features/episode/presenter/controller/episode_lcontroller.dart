import 'package:flutter/cupertino.dart';

import '../../../../app_module.dart';
import '../store/episode_store.dart';

class EpisodeController {
  init() async {
    try {
      await getIt<EpisodeStore>().getEpisodes().then((value) => Future.delayed(const Duration(seconds: 3)));
    } catch (e) {
      debugPrintStack();
    }
  }
}
