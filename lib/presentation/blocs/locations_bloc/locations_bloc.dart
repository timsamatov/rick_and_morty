import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/data/models/locations_model.dart';
import 'package:rick_and_morty/data/repositories/location_repo.dart';

part 'locations_event.dart';
part 'locations_state.dart';

class LocationsBloc extends Bloc<LocationsEvent, LocationsState> {
  LocationsBloc({required this.repository}) : super(LocationsInitial()) {
    on<GetLocations>((event, emit) async{
      try{
        final model = await repository.getData(
          name: event.name
        );
        emit(
          LocationsSuccess(model: model)
        );
      }catch(e){
        emit(LocationsError());
      }
    });
  }
      final LocationRepo repository;

}
