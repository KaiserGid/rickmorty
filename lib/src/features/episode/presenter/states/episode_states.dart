import '../../domain/entities/episode_entity.dart';

abstract class EpsodeState {}

class LoadingEpsodeState extends EpsodeState {}

class IdleEpisodeState extends EpsodeState {
  List<EpisodeEntity> epsode;

  IdleEpisodeState({required this.epsode});
}

class ErrorEpsodeState extends EpsodeState {
  final String message;

  ErrorEpsodeState({required this.message});
}
