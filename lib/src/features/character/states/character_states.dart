import 'package:rickmorty/src/core/features/characteres/models/character_entity.dart';

abstract class CharacterState {}

class LoadingCharacterState extends CharacterState {}

class IdleCharacterState extends CharacterState {
  List<Character> characters;

  IdleCharacterState({required this.characters});
}

class ErrorCharacterState extends CharacterState {
  final String message;

  ErrorCharacterState({required this.message});
}
