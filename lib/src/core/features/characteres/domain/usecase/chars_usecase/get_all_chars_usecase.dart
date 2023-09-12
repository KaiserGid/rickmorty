import 'package:rickmorty/src/core/features/characteres/models/character_entity.dart';

import '../../repositories/character_repository.dart';

abstract class GetAllCharsUsecase {
  Future<List<Character>> call();
}

class GetAllCharsUsecaseImpl implements GetAllCharsUsecase {
  final CharacterRepository characterRepository;

  GetAllCharsUsecaseImpl({
    required this.characterRepository,
  });

  @override
  Future<List<Character>> call() {
    return characterRepository.getAllCharacters();
  }
}
