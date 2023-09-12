import 'package:flutter/material.dart';
import 'package:rickmorty/src/features/character/states/character_states.dart';

import '../../../../app_module.dart';
import '../store/character_store.dart';

class CharacterPageController {
  Future init() async {
    try {
      IdleCharacterState(characters: await getIt<CharacterStore>().getCaracteres());
    } catch (e) {
      debugPrintStack();
    }
  }
}
