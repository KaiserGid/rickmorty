import 'package:flutter/material.dart';

import '../../../../app_module.dart';
import '../store/character_store.dart';

class CharacterPageController {
  bool isLoading = true;

  Future init() async {
    try {
      await getIt<CharacterStore>().getCaracteres().then((value) => Future.delayed(const Duration(seconds: 6)));
      isLoading = false;
    } catch (e) {
      debugPrintStack();
    }
  }
}
