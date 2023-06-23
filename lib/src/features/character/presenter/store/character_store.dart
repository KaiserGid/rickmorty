import 'package:flutter/material.dart';
import 'package:rickmorty/src/core/features/characteres/models/character_entity.dart';
import 'package:rickmorty/src/features/character/domain/usecase/chars_usecase/get_all_chars_usecase.dart';

class CharacterStore extends ChangeNotifier {
  GetAllCharsUsecase getAllCharsUsecase;

  CharacterStore({
    required this.getAllCharsUsecase,
  });

  List<Character> characteres = [];

  Future getCaracteres() async {
    characteres.addAll(await getAllCharsUsecase());

    notifyListeners();
  }
}
