import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/data/models/episode_model.dart';
import 'package:rick_and_morty/data/repositories/episode_repo.dart';

part 'episode_event.dart';
part 'episode_state.dart';

class EpisodeBloc extends Bloc<EpisodeEvent, EpisodeState> {
  EpisodeBloc({required this.repository}) : super(EpisodeInitial()) {
    on<GetEpisodes>((event, emit) async{
   try{
        final model = await repository.getData(
          name: event.name
        );
        emit(
          EpisodeSuccess(model: model)
        );
      }catch(e){
        emit(EpisodeError());
      }
    });
  }
      final EpisodeRepo repository;
}
