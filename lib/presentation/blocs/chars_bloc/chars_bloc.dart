import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/data/models/character_model.dart';
import 'package:rick_and_morty/data/repositories/chars_repo.dart';

part 'chars_event.dart';
part 'chars_state.dart';

class CharsBloc extends Bloc<CharsEvent, CharsState> {
  CharsBloc({required this.repository}) : super(CharsInitial()) {
    on<GetChars>((event, emit) async{
      try{
        final model = await repository.getData(
          name: event.name
        );
        emit(
          CharsSuccess(model: model)
        );
      }catch(e){
        emit(CharsError());
      }
    });
  }
  final CharsRepo repository; 
}
