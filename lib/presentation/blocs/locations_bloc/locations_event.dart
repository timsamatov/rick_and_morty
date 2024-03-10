part of 'locations_bloc.dart';

@immutable
sealed class LocationsEvent {}

class GetLocations extends LocationsEvent{
  final String? name;
  GetLocations({this.name});
}
