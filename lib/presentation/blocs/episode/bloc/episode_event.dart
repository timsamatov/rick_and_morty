part of 'episode_bloc.dart';

@immutable
sealed class EpisodeEvent {}

class GetEpisodes extends EpisodeEvent{
  final String? name;
  GetEpisodes({this.name});
}
