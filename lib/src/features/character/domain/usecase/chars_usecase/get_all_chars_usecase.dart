import 'package:rickmorty/src/features/character/domain/entities/character_entity.dart';

import '../../repositories/character_repository.dart';

abstract class GetAllCharsUsecase {
  Future<List<CharacterEntity>> call();
}

class GetAllCharsUsecaseImpl implements GetAllCharsUsecase {
  final CharacterRepository characterRepository;

  GetAllCharsUsecaseImpl({
    required this.characterRepository,
  });

  @override
  Future<List<CharacterEntity>> call() {
    return characterRepository.getAllCharacters();
  }
}
