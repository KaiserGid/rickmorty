import 'package:flutter/material.dart';
import 'package:rickmorty/src/core/features/characteres/domain/usecase/chars_usecase/get_all_chars_usecase.dart';
import 'package:rickmorty/src/core/features/characteres/models/character_entity.dart';
import 'package:rickmorty/src/features/character/states/character_states.dart';

class CharacterStore extends ChangeNotifier {
  GetAllCharsUsecase getAllCharsUsecase;

  CharacterState state = LoadingCharacterState();

  CharacterStore({
    required this.getAllCharsUsecase,
  });

  List<Character> characteres = [];

  Future getCaracteres() async {
    state = LoadingCharacterState();
    notifyListeners();
    characteres.addAll(await getAllCharsUsecase());
    state = IdleCharacterState(characters: characteres);
    notifyListeners();
  }
}
